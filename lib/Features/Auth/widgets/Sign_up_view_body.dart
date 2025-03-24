import 'package:benta/Features/Auth/widgets/custom_horizontal_Line.dart';
import 'package:benta/Features/Auth/widgets/custom_text_field.dart';
import 'package:benta/core/utils/app_router.dart';
import 'package:benta/core/utils/constants.dart';
import 'package:benta/core/utils/styles.dart';
import 'package:benta/core/utils/widgets/custom_all_use_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 40.h, left: 24.w, right: 24.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/Group 174.svg'),
              SizedBox(height: 25.h),
              Text('Create new account', style: Styles.style24medium),
              SizedBox(height: 25.h),
              CustomTextField(hintText: 'Full name'),
              SizedBox(height: 20.h),
              CustomTextField(hintText: 'Email or Phone'),
              SizedBox(height: 20.h),
              CustomTextField(hintText: 'Password', isPassword: true),
              SizedBox(height: 25.h),
              CustomAllUseButton(
                title: 'Verify',
                onPressed: () {
                  context.push(AppRouter.kHomeView);
                },
              ),
              SizedBox(height: 33),
              CustomHorizontalLine(),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(flex: 4),

                  Icon(EvaIcons.google_outline, color: kPrimaryColor),
                  Spacer(),
                  Icon(EvaIcons.facebook_outline, color: kPrimaryColor),
                  Spacer(),
                  Icon(EvaIcons.twitter_outline, color: kPrimaryColor),
                  Spacer(flex: 4),
                ],
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?', style: Styles.style16),
                  TextButton(
                    onPressed: () {
                      context.pushReplacement(AppRouter.kLoginView);
                    },
                    child: Text(
                      "Log in",
                      style: Styles.style16.copyWith(color: kPrimaryColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
