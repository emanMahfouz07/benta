import 'package:benta/Features/Auth/presentation/manager/cubit/sign_in_cubit.dart';
import 'package:benta/Features/Auth/presentation/views/widgets/custom_horizontal_Line.dart';
import 'package:benta/Features/Auth/presentation/views/widgets/custom_text_field.dart';
import 'package:benta/core/utils/app_router.dart';
import 'package:benta/core/utils/auth_validation.dart';
import 'package:benta/core/utils/constants.dart';
import 'package:benta/core/utils/helper_class.dart';
import 'package:benta/core/utils/styles.dart';
import 'package:benta/core/utils/widgets/custom_all_use_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 40.h, left: 24.w, right: 24.w),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/login.png'),
                SizedBox(height: 25.h),
                Text('Log in your account', style: Styles.style24medium),
                SizedBox(height: 25.h),
                CustomTextField(
                  hintText: 'Email',
                  controller: emailController,
                  validator: MyValidators.emailValidator,
                ),
                SizedBox(height: 19.h),
                CustomTextField(
                  hintText: 'Password',
                  isPassword: true,
                  controller: passwordController,
                  validator: MyValidators.passwordValidator,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      context.push(AppRouter.kForgetPasswordView);
                    },
                    child: Text(
                      'Forget Password?',
                      style: Styles.style16.copyWith(color: kPrimaryColor),
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                BlocConsumer<SignInCubit, SignInState>(
                  listener: (context, state) {
                    if (state is SignInSuccess) {
                      context.push(AppRouter.kHomeView);
                    } else if (state is SignInFailure) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.error)));
                    }
                  },
                  builder: (context, state) {
                    return CustomAllUseButton(
                      title: 'Log in',
                      onPressed: () {
                        final email = emailController.text;
                        final password = passwordController.text;

                        context.read<SignInCubit>().signIn(email, password);
                      },
                    );
                  },
                ),
                SizedBox(height: 24.h),
                CustomHorizontalLine(),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(flex: 4),
                    IconButton(
                      icon: Icon(EvaIcons.google_outline, color: kPrimaryColor),
                      onPressed: () async {
                        await HelperClass.goToWebPage(
                          "https://mail.google.com/",
                        );
                      },
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(
                        EvaIcons.facebook_outline,
                        color: kPrimaryColor,
                      ),
                      onPressed: () async {
                        await HelperClass.goToWebPage(
                          'https://www.facebook.com/',
                        );
                      },
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(
                        EvaIcons.twitter_outline,
                        color: kPrimaryColor,
                      ),
                      onPressed: () async {
                        await HelperClass.goToWebPage('https://x.com/home');
                      },
                    ),
                    Spacer(flex: 4),
                  ],
                ),
                SizedBox(height: 25.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?', style: Styles.style16),
                    TextButton(
                      onPressed: () {
                        context.pushReplacement(AppRouter.kSignUpView);
                      },
                      child: Text(
                        "Sign Up",
                        style: Styles.style16.copyWith(color: kPrimaryColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
