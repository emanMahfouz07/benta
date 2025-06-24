import 'package:benta/core/utils/app_router.dart';
import 'package:benta/core/utils/styles.dart';
import 'package:benta/core/utils/widgets/custom_all_use_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CongratsView extends StatelessWidget {
  const CongratsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/congrats.svg'),
            Text('Congratulation', style: Styles.style24medium),
            SizedBox(height: 30.h),
            Text('payment completed Successfully'),
            SizedBox(height: 30.h),
            CustomAllUseButton(
              title: 'Back to home',
              onPressed: () {
                context.pushReplacement(AppRouter.kAllProductsView);
              },
            ),
          ],
        ),
      ),
    );
  }
}
