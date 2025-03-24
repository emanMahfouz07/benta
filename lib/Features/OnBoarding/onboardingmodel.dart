import 'package:benta/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

PageViewModel buildPage({
  required String imagePath,
  required String body,
  required BuildContext context,
}) {
  final size = MediaQuery.of(context).size;

  return PageViewModel(
    title: "",

    bodyWidget: Text(
      body,
      textAlign: TextAlign.center,
      style: Styles.style20.copyWith(fontSize: size.width * 0.045),
    ),
    image: Center(child: _buildImage(imagePath, size)),
    decoration: _pageDecoration(size),
  );
}

PageDecoration _pageDecoration(Size size) {
  return PageDecoration(
    bodyAlignment: Alignment.center,
    footerPadding: EdgeInsets.all(0),
    titlePadding: EdgeInsets.all(0),
    contentMargin: EdgeInsets.all(0),
    bodyPadding: EdgeInsets.all(0),
  );
}

Widget _buildImage(String path, Size size) {
  return Image.asset(path, height: size.height * 0.3, width: size.width * 0.8);
}
