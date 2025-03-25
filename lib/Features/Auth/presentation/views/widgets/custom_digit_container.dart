import 'package:benta/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDigitContainer extends StatelessWidget {
  const CustomDigitContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      width: 56.w,
      child: Stack(
        children: [
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xffF1F4F4),
              focusColor: Color(0xffD4DDDD),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.r),
                  topRight: Radius.circular(8.r),
                ),
                borderSide: BorderSide.none,
              ),
            ),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(height: 3.h, color: kPrimaryColor),
          ),
        ],
      ),
    );
  }
}
