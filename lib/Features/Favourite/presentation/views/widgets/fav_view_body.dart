import 'package:benta/Features/Favourite/presentation/views/widgets/fav_item_container.dart';
import 'package:benta/Features/Home/presentation/views/widgets/custom_search_bar.dart';
import 'package:benta/core/utils/app_router.dart';
import 'package:benta/core/utils/widgets/custom_all_use_button.dart';
import 'package:benta/core/utils/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cartItems = [
      {
        "title": "Sofa - bed",
        "image": 'assets/images/peyton_2_seater_sofa-compact_sized 1.png',
        "rate": 4.5,
        "price": "100.00",
      },
      {
        "title": "Sofa - bed",
        "image": 'assets/images/peyton_2_seater_sofa-compact_sized 1.png',
        "rate": 4.7,
        "price": " 85.50",
      },
    ];
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(title: 'Favourite'),
            CustomSearchBar(),
            SizedBox(height: 27.h),
            ListView.builder(
              shrinkWrap: true,
              itemCount: cartItems.length,
              itemBuilder: (BuildContext context, int index) {
                final item = cartItems[index];
                return FavouriteItemContainer(
                  title: item['title'],
                  image: item['image'],
                  price: item['price'],
                  rate: item['rate'],
                );
              },
            ),
            SizedBox(height: 25.h),
            CustomAllUseButton(
              title: 'Add all item to cart ',
              onPressed: () {
                context.pushReplacement(AppRouter.kMyCartView);
              },
            ),
          ],
        ),
      ),
    );
  }
}
