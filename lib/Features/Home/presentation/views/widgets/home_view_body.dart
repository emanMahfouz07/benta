import 'package:another_flushbar/flushbar.dart';
import 'package:benta/Features/Cart/data/models/add_to_cart.dart';
import 'package:benta/Features/Cart/presentation/manager/add%20to%20cart%20cubit/add_to_cart_cubit.dart';
import 'package:benta/Features/Home/presentation/manager/categoryFilterCubit/category_filter_cubit.dart';
import 'package:benta/Features/Home/presentation/manager/cubit/get_item_cubit.dart';
import 'package:benta/Features/Home/presentation/views/widgets/home_app_bar.dart';
import 'package:benta/Features/Home/presentation/views/widgets/custom_item_container.dart';
import 'package:benta/Features/Home/presentation/views/widgets/custom_scroll_bar.dart';
import 'package:benta/Features/Home/presentation/views/widgets/custom_search_bar.dart';
import 'package:benta/Features/Home/presentation/views/widgets/custom_see_all.dart';
import 'package:benta/Features/Home/presentation/views/widgets/image_carusol.dart';
import 'package:benta/core/utils/api_services.dart';
import 'package:benta/core/utils/app_router.dart';
import 'package:benta/core/utils/constants.dart';
import 'package:benta/core/utils/shared_pref.dart';
import 'package:benta/core/utils/widgets/flushbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> favoriteItems = [];

    String getFullImageUrl(String path) {
      final cleanedPath = path.replaceFirst('uploads/', '');
      return 'https://zbooma.com/$cleanedPath';
    }

    return Padding(
      padding: EdgeInsets.only(top: 40.h, left: 24.w, right: 24.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            HomeAppBar(),
            SizedBox(height: 25.h),
            Row(
              children: [
                IconButton(
                  icon: Icon(FontAwesome.bell),
                  color: kPrimaryColor,
                  onPressed: () {
                    context.push(AppRouter.kNotificationView);
                  },
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: CustomSearchBar(
                    suffixIcon: Icons.mic_none,
                    customICon: Icons.camera_alt_outlined,
                  ),
                ),
                SizedBox(width: 10.w),
              ],
            ),
            SizedBox(height: 25.h),
            AutoMovingCarousel(),
            SizedBox(height: 30.h),
            CustomSeeAllWidget(title: 'Categories'),
            SizedBox(height: 15.h),
            BlocProvider(
              create:
                  (_) =>
                      CategoryFilterCubit(ApiServices(Dio()))..getCategories(),
              child: const CategoryFilter(),
            ),
            SizedBox(height: 30.h),
            BlocConsumer<GetItemCubit, GetItemState>(
              listener: (context, state) {
                if (state is GetItemFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Failed to load items: ${state.errorMessage}',
                      ),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is GetItemLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is GetItemSuccess) {
                  return SizedBox(
                    height: 192.h,
                    child: ListView.builder(
                      itemCount: state.items.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        final item = state.items[index];
                        return CustomItemContainer(
                          title: item.name,
                          price: item.price.toString(),
                          rate: '4.5',
                          image:
                              item.images.isNotEmpty
                                  ? getFullImageUrl(item.images.last)
                                  : 'https://pngimg.com/uploads/chair/chair_PNG6905.png',
                          onFavoriteChanged: (isFavorite) {},
                          onAddToCart: () {
                            final userId = SharedPrefsHelper.getUserId();
                            if (userId != null) {
                              // Use AddToCartCubit to add item to the cart
                              context.read<AddToCartCubit>().addToCart(
                                AddToCartModel(
                                  userId: userId,
                                  productId: item.id,
                                  quantity: 1,
                                ),
                              );

                              showFlashbar().show(context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Please log in first")),
                              );
                            }
                          },
                        );
                      },
                    ),
                  );
                } else {
                  return Center(child: Text('Select a category'));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
