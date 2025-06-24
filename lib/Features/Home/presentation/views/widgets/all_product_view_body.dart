import 'package:benta/Features/Cart/data/models/add_to_cart.dart';
import 'package:benta/Features/Cart/presentation/manager/add%20to%20cart%20cubit/add_to_cart_cubit.dart';
import 'package:benta/Features/Home/presentation/manager/all%20Products%20Cubit/all_products_cubit.dart';
import 'package:benta/Features/Home/presentation/views/widgets/custom_item_container.dart';
import 'package:benta/core/utils/shared_pref.dart';
import 'package:benta/core/utils/widgets/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllProductViewBody extends StatefulWidget {
  const AllProductViewBody({super.key});

  @override
  State<AllProductViewBody> createState() => _AllProductViewBodyState();
}

class _AllProductViewBodyState extends State<AllProductViewBody> {
  Set<String> _favorites = {};
  @override
  void initState() {
    super.initState();
    _loadFavourite();
  }

  void _loadFavourite() {
    setState(() {
      _favorites = Set<String>.from(SharedPrefsHelper.getFavoriteItems());
    });
  }

  @override
  Widget build(BuildContext context) {
    context.read<AllProductsCubit>().getAllProducts();
    return BlocBuilder<AllProductsCubit, AllProductsState>(
      builder: (context, state) {
        if (state is AllProductsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AllProductsError) {
          return Center(child: Text("Error: ${state.message}"));
        } else if (state is AllProductsSuccess) {
          final products = state.products;

          if (products.isEmpty) {
            return const Center(child: Text("No products found."));
          }

          return SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.w,
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 10.w,
                  childAspectRatio: 0.85,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return CustomItemContainer(
                    title: product.name,
                    price: product.price.toStringAsFixed(2),
                    rate: "4.5",
                    image: 'assets/images/Helena-3S-Sofa-60-80K-9 1.png',
                    id: product.id,
                    isFavorite: _favorites.contains(product.id.toString()),
                    onFavoriteChanged: (isFavourite) async {
                      final itemId = product.id.toString();
                      setState(() {
                        if (isFavourite) {
                          _favorites.add(itemId);
                          SharedPrefsHelper.addFavoriteItem(itemId);
                        } else {
                          _favorites.remove(itemId);
                          SharedPrefsHelper.removeFavoriteItem(itemId);
                        }
                      });
                    },

                    onAddToCart: () {
                      final userId = SharedPrefsHelper.getUserId();
                      if (userId != null) {
                        context.read<AddToCartCubit>().addToCart(
                          AddToCartModel(
                            userId: userId,
                            productId: product.id,
                            quantity: 1,
                          ),
                        );

                        showFlashbar(
                          message: 'Item added Successfully!',
                          backgroundColor: Colors.green,
                          icon: Icons.check_circle,
                        ).show(context);
                      } else {
                        showFlashbar(
                          message: 'Please log in first',
                          backgroundColor: Colors.red,
                          icon: Icons.error_rounded,
                        ).show(context);
                      }
                    },
                  );
                },
              ),
            ),
          );
        }

        return const SizedBox.shrink(); // For initial state
      },
    );
  }
}
