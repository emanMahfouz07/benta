import 'package:benta/Features/Home/presentation/views/widgets/home_app_bar.dart';
import 'package:benta/Features/Home/presentation/views/widgets/custom_item_container.dart';
import 'package:benta/Features/Home/presentation/views/widgets/custom_scroll_bar.dart';
import 'package:benta/Features/Home/presentation/views/widgets/custom_search_bar.dart';
import 'package:benta/Features/Home/presentation/views/widgets/custom_see_all.dart';
import 'package:benta/Features/Home/presentation/views/widgets/image_carusol.dart';
import 'package:benta/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:icons_plus/icons_plus.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40.h, left: 24.w, right: 24.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            HomeAppBar(),
            SizedBox(height: 25.h),
            Row(
              children: [
                const Icon(FontAwesome.bell, color: kPrimaryColor),
                SizedBox(width: 8.w),
                Expanded(child: CustomSearchBar(suffixIcon: Icons.camera_alt)),
                SizedBox(width: 10.w),
              ],
            ),
            SizedBox(height: 25.h),
            AutoMovingCarousel(),
            SizedBox(height: 30.h),
            CustomSeeAllWidget(title: 'Categories'),
            SizedBox(height: 15.h),
            CategoryFilter(),
            SizedBox(height: 30.h),
            CustomSeeAllWidget(title: 'Sofa'),
            SizedBox(height: 15.h),
            SizedBox(
              height: 192.h,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return CustomItemContainer(
                    title: 'Chair',
                    price: '100',
                    rate: '4.5',
                    image: 'assets/images/unsplash_Dp2xzrdXrNs.png',
                  );
                },
              ),
            ),
            SizedBox(height: 15.h),
            CustomSeeAllWidget(title: 'Chair'),
            SizedBox(height: 15.h),
            SizedBox(
              height: 192.h,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return CustomItemContainer(
                    title: 'Sofa',
                    price: '100',
                    rate: '4.5',
                    image: 'assets/images/81Fdsh6B2vL 1.png',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
