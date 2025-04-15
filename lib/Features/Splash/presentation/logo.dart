import 'package:benta/core/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:benta/core/utils/app_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigateAfterDelay();
  }

  void _navigateAfterDelay() async {
    await Future.delayed(const Duration(seconds: 2));

    bool isFirstTime = SharedPrefsHelper.isFirstTime();
    bool isLoggedIn = SharedPrefsHelper.getUserId() != null;

    if (isFirstTime) {
      context.go(AppRouter.kOnBoardingView);
    } else if (isLoggedIn) {
      context.go(AppRouter.kHomeView);
    } else {
      context.go(AppRouter.kLoginView);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset('assets/images/logo2.png')),
    );
  }
}
