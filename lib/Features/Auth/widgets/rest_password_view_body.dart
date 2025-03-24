import 'package:benta/Features/Auth/widgets/custom_text_field.dart';
import 'package:benta/core/utils/app_router.dart';
import 'package:benta/core/utils/styles.dart';
import 'package:benta/core/utils/widgets/custom_all_use_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SvgPicture.asset('assets/images/resetPass.svg'),
            SizedBox(height: 25.h),
            Text('Reset password', style: Styles.style24medium),
            SizedBox(height: 25.h),
            CustomTextField(hintText: 'New password'),
            SizedBox(height: 20.h),
            CustomTextField(hintText: 'Confirm Password'),
            SizedBox(height: 25.h),
            CustomAllUseButton(
              title: 'Continue',
              onPressed: () {
                context.push(AppRouter.kSignUpView);
              },
            ),
          ],
        ),
      ),
    );
  }
}
