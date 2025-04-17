import 'package:benta/Features/Favourite/presentation/views/widgets/fav_item_container.dart';
import 'package:benta/Features/Home/presentation/views/widgets/custom_search_bar.dart';
import 'package:benta/core/utils/app_router.dart';
import 'package:benta/core/utils/shared_pref.dart';
import 'package:benta/core/utils/widgets/custom_all_use_button.dart';
import 'package:benta/core/utils/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cartItems = [
      {
        "title": "Sofa - bed",
        "image": 'assets/images/peyton_2_seater_sofa-compact_sized 1.png',
        "rate": 4.5,
        "price": 100.00,
      },
      {
        "title": "Sofa - bed",
        "image": 'assets/images/peyton_2_seater_sofa-compact_sized 1.png',
        "rate": 4.7,
        "price": 85.50,
      },
      {
        "title": "Modern Chair",
        "image": 'assets/images/mandi-arm-chair-in-cream 1.png',
        "rate": 4.9,
        "price": 100,
      },
    ];
    return Padding(
      padding: EdgeInsets.all(24.r),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(title: 'My Orders'),
            CustomSearchBar(),
            SizedBox(height: 28.h),
            ListView.builder(
              shrinkWrap: true,
              itemCount: cartItems.length,
              itemBuilder: (BuildContext context, int index) {
                final item = cartItems[index];
                return FavouriteItemContainer(
                  title: item['title'],
                  image: item['image'],
                  price: item['price'].toString(),
                  rate: '4.5',
                  isFavorite: false,
                  onFavChange: () {},
                );
              },
            ),
            SizedBox(height: 25.h),
            CustomAllUseButton(
              title: 'You have ${cartItems.length} items in cart ',
              onPressed: () {
                print(
                  "Favorites in storage: ${SharedPrefsHelper.getFavoriteItems()}",
                );
                context.pushReplacement(AppRouter.kMyCartView);
              },
            ),
          ],
        ),
      ),
    );
  }
}
