import 'package:benta/Features/Cart/presentation/manager/cubit/product_cubit.dart';
import 'package:benta/Features/Cart/presentation/views/widgets/Item_info_bottom_sheet.dart';
import 'package:benta/Features/Cart/presentation/views/widgets/custom_color_picker.dart';
import 'package:benta/Features/Cart/presentation/views/widgets/custom_counter.dart';
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
    for (int i = 1; i <= 52; i++) {
      images.add(AssetImage('assets/sample/$i.png'));
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
                                child: ImageView360(
                                  key: UniqueKey(),
                                  imageList: imageList,
                                  autoRotate: true,
                                  rotationCount: 2,
                                  swipeSensitivity: 2,
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
