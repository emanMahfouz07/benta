import 'package:benta/Features/Cart/data/models/add_to_cart.dart';
import 'package:benta/Features/Cart/presentation/manager/add%20to%20cart%20cubit/add_to_cart_cubit.dart';
import 'package:benta/Features/Cart/presentation/manager/cubit/product_cubit.dart';
import 'package:benta/Features/Cart/presentation/views/widgets/Item_info_bottom_sheet.dart';
import 'package:benta/Features/Cart/presentation/views/widgets/custom_color_picker.dart';
import 'package:benta/Features/Cart/presentation/views/widgets/custom_counter.dart';
import 'package:benta/core/custom_360_viewer.dart';
import 'package:benta/core/utils/app_router.dart';
import 'package:benta/core/utils/shared_pref.dart';
import 'package:benta/core/utils/widgets/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:imageview360/imageview360.dart';

class ItemInfoViewBody extends StatefulWidget {
  const ItemInfoViewBody({super.key, required this.productId});
  final int productId;

  @override
  State<ItemInfoViewBody> createState() => _ItemInfoViewBodyState();
}

class _ItemInfoViewBodyState extends State<ItemInfoViewBody> {
  List<ImageProvider> imageList = [];

  @override
  void initState() {
    super.initState();
    loadImages();
    context.read<ProductCubit>().fetchProductInfo(widget.productId.toString());
  }

  void loadImages() {
    List<ImageProvider> images = [];
    for (int i = 1; i <= 12; i++) {
      images.add(AssetImage('assets/test/$i.png'));
    }
    setState(() {
      imageList = images;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductFailure) {
          return showFlashbar(
            message: state.error,
            backgroundColor: Colors.redAccent,
            icon: Icons.error,
          );
        } else if (state is ProductSuccesss) {
          final product = state.productList;
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 40.h, left: 24.w, right: 24.w),
              child: SafeArea(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                context.pop();
                              },
                              icon: Icon(Icons.arrow_back_ios),
                            ),
                            Spacer(),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.favorite_outline),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            ColorPicker(),

                            Center(
                              child: SizedBox(
                                width: 250.w,
                                height: 340.h,
                                child: Fake3DSingleImageSpin(
                                  imagePath:
                                      'assets/images/Helena-3S-Sofa-60-80K-9 1.png',
                                ),
                              ),
                            ),
                          ],
                        ),

                        ItemInfoBottomSheet(
                          imageList: product.images,
                          title: product.name,
                          desc: product.description,
                          price: product.price.toString(),
                          onPressed: () {
                            final userId = SharedPrefsHelper.getUserId();
                            if (userId != null) {
                              context.read<AddToCartCubit>().addToCart(
                                AddToCartModel(
                                  userId: userId,
                                  productId: product.id,
                                  quantity: 1,
                                ),
                              );
                            }
                            context.push(AppRouter.kMyCartView);
                          },
                        ),
                      ],
                    ),
                    CustomCounter(),
                  ],
                ),
              ),
            ),
          );
        } else {
          return showFlashbar(
            message: 'Unknow Error',
            backgroundColor: Colors.redAccent,
            icon: Icons.error,
          );
        }
      },
    );
  }
}
