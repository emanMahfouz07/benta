import 'package:benta/Features/Auth/widgets/custom_digit_container.dart';
import 'package:benta/core/utils/app_router.dart';
import 'package:benta/core/utils/constants.dart';
import 'package:benta/core/utils/styles.dart';
import 'package:benta/core/utils/widgets/custom_all_use_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class VerificationViewBody extends StatelessWidget {
  const VerificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 60.h, horizontal: 47.w),
        child: Column(
          children: [
            SvgPicture.asset('assets/images/Group 148.svg'),
            SizedBox(height: 25.h),
            Text('Enter code', style: Styles.style24medium),
            SizedBox(height: 25.h),
            Form(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomDigitContainer(),
                  CustomDigitContainer(),
                  CustomDigitContainer(),
                  CustomDigitContainer(),
                ],
              ),
            ),
            SizedBox(height: 15.h),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Resend code?',
                  style: Styles.style16.copyWith(color: kPrimaryColor),
                ),
              ),
            ),
            SizedBox(height: 25.h),
            CustomAllUseButton(
              title: 'Continue',
              onPressed: () {
                context.push(AppRouter.kResetPasswordView);
              },
            ),
          ],
        ),
      ),
    );
  }
}
