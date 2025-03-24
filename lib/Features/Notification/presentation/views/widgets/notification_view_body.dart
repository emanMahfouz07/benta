import 'package:benta/Features/Home/presentation/views/widgets/custom_item_container.dart';
import 'package:benta/Features/Home/presentation/views/widgets/custom_search_bar.dart';
import 'package:benta/Features/Home/presentation/views/widgets/custom_see_all.dart';
import 'package:benta/Features/Notification/presentation/views/widgets/offer_item_container.dart';
import 'package:benta/core/utils/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> offerItems = [
      {
        "title": "Sofa - bed",
        "image": 'assets/images/medium_WK_Ishino_0031_tif_85f15b1a07 1.png',
        "rate": "4.5",
        "price": "100.00",
        "offerPrice": "150.0",
        "off": '30',
      },
      {
        "title": "Sofa - bed",
        "image": 'assets/images/Helena-3S-Sofa-60-80K-9 1.png',
        "rate": "4.5",
        "price": "100.00",
        "offerPrice": "150.0",
        "off": '30',
      },
      {
        "title": "Sofa - bed",
        "image": 'assets/images/Helena-3S-Sofa-60-80K-9 1.png',
        "rate": "4.5",
        "price": "100.00",
        "offerPrice": '150.0',
        "off": '30',
      },
      {
        "title": "Sofa - bed",
        "image": 'assets/images/Helena-3S-Sofa-60-80K-9 1.png',
        "rate": " 4.5",
        "price": "100.00",
        "offerPrice": '150.0',
        "off": '30',
      },
    ];
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(24.0.r),
      child: Column(
        children: [
          CustomAppBar(title: 'Notifications'),
          SizedBox(height: 30.h),
          CustomSearchBar(),
          SizedBox(height: 25.h),
          CustomSeeAllWidget(title: 'Offers'),
          //////// Offers List////////
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: offerItems.length,
              itemBuilder: (context, index) {
                final items = offerItems[index];
                return OfferItemContainer(
                  title: items['title'],
                  price: items['price'].toString(),
                  rate: items['rate'],
                  image: items['image'],
                  offerPrice: items['offerPrice'],
                  off: items['off'],
                );
              },
            ),
          ),
          SizedBox(height: 25.h),
          CustomSeeAllWidget(title: 'New Collections'),
          SizedBox(height: 20.h),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,

              itemCount: offerItems.length,
              itemBuilder: (context, index) {
                final items = offerItems[index];
                return OfferItemContainer(
                  title: items['title'],
                  price: items['price'].toString(),
                  rate: items['rate'],
                  image: items['image'],
                  offerPrice: items['offerPrice'],
                  off: items['off'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
