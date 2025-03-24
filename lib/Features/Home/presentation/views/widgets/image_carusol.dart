import 'dart:async';
import 'package:benta/core/utils/constants.dart';
import 'package:flutter/material.dart';

class ImageCarusol extends StatefulWidget {
  const ImageCarusol({super.key});

  @override
  State<ImageCarusol> createState() => _ImageCarusolState();
}

class _ImageCarusolState extends State<ImageCarusol> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentPage = 0;
  Timer? _timer;

  final List<String> images = [
    'assets/images/fd1_lngchr_bh_frontlow-field-lounge-chair-tait-blush_2 1.png',
    'assets/images/fd1_lngchr_bh_frontlow-field-lounge-chair-tait-blush_2 1.png',
    'assets/images/fd1_lngchr_bh_frontlow-field-lounge-chair-tait-blush_2 1.png',
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: _pageController,
            itemCount: images.length,
            onPageChanged: (page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return AnimatedContainer(
                width: 300,
                duration: Duration(milliseconds: 500),
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: kBGColor,
                  borderRadius: BorderRadius.circular(30),
                ),

                child: Row(
                  children: [
                    Text('30'),
                    Image.asset(images[index], fit: BoxFit.cover),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(images.length, (index) {
            bool isActive = index == _currentPage;
            return AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 5),
              width: isActive ? 12 : 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive ? kPrimaryColor : Colors.grey,
              ),
            );
          }),
        ),
      ],
    );
  }
}
