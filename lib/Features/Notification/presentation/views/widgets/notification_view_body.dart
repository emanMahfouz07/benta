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
        "title": "Sofa",
        "image": 'assets/images/medium_WK_Ishino_0031_tif_85f15b1a07 1.png',
        "rate": "4.5",
        "price": "100",
        "offerPrice": "150",
        "off": '30',
      },
      {
        "title": "Sofa",
        "image": 'assets/images/Helena-3S-Sofa-60-80K-9 1.png',
        "rate": "4.5",
        "price": "100",
        "offerPrice": "150",
        "off": '30',
      },
      {
        "title": "Sofa",
        "image": 'assets/images/Helena-3S-Sofa-60-80K-9 1.png',
        "rate": "4.5",
        "price": "100",
        "offerPrice": '150',
        "off": '30',
      },
      {
        "title": "Sofa",
        "image": 'assets/images/Helena-3S-Sofa-60-80K-9 1.png',
        "rate": " 4.5",
        "price": "100",
        "offerPrice": '150',
        "off": '30',
      },
    ];
    return Padding(
      padding: EdgeInsets.only(top: 40.r, left: 24.w, right: 24.w),
      child: Column(
        children: [
          CustomAppBar(title: 'Notifications'),
          SizedBox(height: 30.h),
          CustomSearchBar(),
          SizedBox(height: 25.h),
          CustomSeeAllWidget(title: 'Offers'),
          SizedBox(height: 20.h),
          //////// Offers List////////
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: offerItems.length,
              itemBuilder: (context, index) {
                final items = offerItems[index];
                return OfferItemContainer(
                  title: items['title'],
                  price: items['price'],
                  rate: items['rate'],
                  image: items['image'],
                  offerPrice: items['offerPrice'],
                  off: items['off'],
                );
              },
            ),
          ),

          CustomSeeAllWidget(title: 'New Collections'),
          SizedBox(height: 20.h),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: offerItems.length,
              itemBuilder: (context, index) {
                final items = offerItems[index];
                return OfferItemContainer(
                  title: items['title'],
                  price: items['price'],
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
