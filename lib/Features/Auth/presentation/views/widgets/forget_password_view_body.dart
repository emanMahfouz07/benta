import 'package:benta/Features/Auth/presentation/views/widgets/custom_text_field.dart';
import 'package:benta/core/utils/app_router.dart';
import 'package:benta/core/utils/styles.dart';
import 'package:benta/core/utils/widgets/custom_all_use_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    return Center(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 60.h, horizontal: 24.w),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
              ),
              SvgPicture.asset('assets/images/Group 156.svg'),
              SizedBox(height: 25.h),
              Text('Forgot password', style: Styles.style24medium),
              SizedBox(height: 25.h),
              CustomTextField(
                hintText: 'Email or Phone',
                controller: emailController,
              ),
              SizedBox(height: 25.h),
              CustomAllUseButton(
                title: 'Continue',
                onPressed: () {
                  context.push(AppRouter.kVerificataionView);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
