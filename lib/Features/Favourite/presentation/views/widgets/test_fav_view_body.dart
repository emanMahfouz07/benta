import 'package:benta/Features/Cart/data/models/add_to_cart.dart';
import 'package:benta/Features/Cart/presentation/manager/add%20to%20cart%20cubit/add_to_cart_cubit.dart';
import 'package:benta/Features/Favourite/presentation/views/widgets/fav_item_container.dart';
import 'package:benta/Features/Home/data/models/product_model.dart';
import 'package:benta/Features/Home/presentation/views/widgets/custom_search_bar.dart';
import 'package:benta/core/utils/api_services.dart';
import 'package:benta/core/utils/app_router.dart';
import 'package:benta/core/utils/shared_pref.dart';
import 'package:benta/core/utils/widgets/custom_all_use_button.dart';
import 'package:benta/core/utils/widgets/custom_app_bar.dart';
import 'package:benta/core/utils/widgets/flushbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class TestFavViewBody extends StatefulWidget {
  const TestFavViewBody({super.key});

  @override
  State<TestFavViewBody> createState() => _TestFavViewBodyState();
}

class _TestFavViewBodyState extends State<TestFavViewBody> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();
  bool _showButton = true;
  bool _canScroll = false;

  List<Product> favoriteItems = [];
  Set<String> favoriteIds = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadFavoriteItems();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        setState(() {
          _canScroll = _scrollController.position.maxScrollExtent > 0;
        });
      }
    });

    _scrollController.addListener(() {
      final direction = _scrollController.position.userScrollDirection;
      if (_canScroll) {
        if (direction == ScrollDirection.reverse && _showButton) {
          setState(() => _showButton = false);
        } else if (direction == ScrollDirection.forward && !_showButton) {
          setState(() => _showButton = true);
        }
      }
    });
  }

  String getImageForProduct(int id) {
    final productImages = [
      'assets/images/81Fdsh6B2vL 1.png',
      'assets/images/mandi-arm-chair-in-cream 2.png',
      'assets/images/medium_WK_Ishino_0031_tif_85f15b1a07 1.png',
      'assets/images/Helena-3S-Sofa-60-80K-9 1.png',
      'assets/images/peyton_2_seater_sofa-compact_sized 1.png',
    ];
    return productImages[id % productImages.length];
  }

  Future<void> loadFavoriteItems() async {
    final ids = SharedPrefsHelper.getFavoriteItems();
    setState(() {
      favoriteIds = ids.toSet();
      isLoading = true;
    });

    try {
      final futures = ids.map((id) => ApiServices(Dio()).getProductById(id));
      final items = await Future.wait(futures);

      setState(() {
        favoriteItems = items;
        isLoading = false;
      });
    } catch (e) {
      showFlashbar(
        message: 'Failed to load favorites $e',
        backgroundColor: Colors.red,
        icon: Icons.error_rounded,
      ).show(context);

      setState(() => isLoading = false);
    }
  }

  void toggleFavorite(Product item) async {
    final id = item.id.toString();

    setState(() {
      if (favoriteIds.contains(id)) {
        favoriteIds.remove(id);
        SharedPrefsHelper.removeFavoriteItem(id);
      } else {
        favoriteIds.add(id);
        SharedPrefsHelper.addFavoriteItem(id);
      }
    });

    loadFavoriteItems();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 16.h)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      CustomAppBar(title: 'Favourite'),
                      CustomSearchBar(controller: searchController),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
              if (isLoading)
                const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                )
              else if (favoriteItems.isEmpty)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(24.w),
                    child: Center(
                      child: const Text("No favorite items found."),
                    ),
                  ),
                )
              else
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final item = favoriteItems[index];
                      final itemId = item.id.toString();
                      final isFavorite = favoriteIds.contains(itemId);

                      return Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: FavouriteItemContainer(
                          key: ValueKey('$itemId-$isFavorite'),
                          title: item.name,
                          image: getImageForProduct(item.id),
                          price: item.price.toString(),
                          rate: '4.5',
                          isFavorite: isFavorite,
                          onFavChange: () => toggleFavorite(item),
                          onAddToCart: () {
                            final userId = SharedPrefsHelper.getUserId();
                            if (userId != null) {
                              context.read<AddToCartCubit>().addToCart(
                                AddToCartModel(
                                  userId: userId,
                                  productId: item.id,
                                  quantity: 1,
                                ),
                              );
                              showFlashbar(
                                message: 'Item Added Succesfully!',
                                backgroundColor: Colors.green,
                                icon: Icons.check_rounded,
                              ).show(context);
                            }
                          },
                        ),
                      );
                    }, childCount: favoriteItems.length),
                  ),
                ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(24.w, 10.h, 24.w, 40.h),
                  child: CustomAllUseButton(
                    title: 'Add all item to cart',
                    onPressed: () {
                      context.pushReplacement(AppRouter.kMyCartView);
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
