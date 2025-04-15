import 'package:benta/Features/OnBoarding/onboardingmodel.dart';
import 'package:benta/core/utils/app_router.dart';
import 'package:benta/core/utils/constants.dart';
import 'package:benta/core/utils/shared_pref.dart';
import 'package:benta/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  void _onDone(BuildContext context) async {
    await SharedPrefsHelper.setFirstTime(false);

    context.go(AppRouter.kLoginView);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () => _onDone(context),
                child: Text(
                  'Skip',
                  style: Styles.style18.copyWith(
                    fontSize: 18.sp,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 92.h),

            Expanded(
              child: IntroductionScreen(
                globalBackgroundColor: Colors.white,
                pages: [
                  buildPage(
                    imagePath: "assets/images/Group 141.png",
                    body:
                        "Design your dream space with interiors that reflect your style!",
                    context: context,
                  ),
                  buildPage(
                    imagePath: "assets/images/Group 145.png",
                    body: "Enjoy a smooth and seamless experience.",
                    context: context,
                  ),
                  buildPage(
                    imagePath: "assets/images/Group 144.png",
                    body: "Join us and explore more!",
                    context: context,
                  ),
                ],

                onDone: () => _onDone(context),
                showSkipButton: false,
                next: Container(
                  height: 55.h,
                  width: 104.w,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Next',
                        style: Styles.style18.copyWith(color: Colors.white),
                      ),
                      const Icon(Icons.arrow_forward_ios, color: Colors.white),
                    ],
                  ),
                ),
                done: Container(
                  height: 55.h,
                  width: 104.w,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      Text(
                        'Done',
                        style: Styles.style18.copyWith(color: Colors.white),
                      ),

                      const Icon(Icons.arrow_forward_ios, color: Colors.white),
                    ],
                  ),
                ),
                dotsDecorator: DotsDecorator(
                  size: const Size(8.0, 8.0),
                  activeSize: Size(16.w, 8.h),
                  activeColor: kPrimaryColor,
                  color: kPrimaryColor,
                  spacing: EdgeInsets.symmetric(horizontal: 4.w),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0.r),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
