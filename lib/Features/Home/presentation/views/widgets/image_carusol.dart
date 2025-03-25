import 'package:benta/core/utils/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AutoMovingCarousel extends StatefulWidget {
  const AutoMovingCarousel({super.key});

  @override
  State<AutoMovingCarousel> createState() => _AutoMovingCarouselState();
}

class _AutoMovingCarouselState extends State<AutoMovingCarousel> {
  final CarouselSliderController controller = CarouselSliderController();
  int _currentIndex = 0;

  final List<String> imageList = [
    'assets/images/fd1_lngchr_bh_frontlow-field-lounge-chair-tait-blush_2 1.png',
    'assets/images/fd1_lngchr_bh_frontlow-field-lounge-chair-tait-blush_2 1.png',
    'assets/images/fd1_lngchr_bh_frontlow-field-lounge-chair-tait-blush_2 1.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: controller,
          options: CarouselOptions(
            height: 176,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 1,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items:
              imageList.map((image) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(30.r),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    width: 372.w,
                    color: kBGColor,
                    child: Image.asset(image, fit: BoxFit.contain),
                  ),
                );
              }).toList(),
        ),
        SizedBox(height: 10.h),
        customIndicator(),
      ],
    );
  }

  Widget customIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(imageList.length, (index) {
        bool isActive = index == _currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4.h),
          width: isActive ? 16 : 8,
          height: 8.h,
          decoration: BoxDecoration(
            color: isActive ? kPrimaryColor : Colors.grey,
            borderRadius: BorderRadius.circular(4.r),
          ),
        );
      }),
    );
  }
}
