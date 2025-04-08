import 'package:benta/core/utils/app_router.dart';
import 'package:benta/core/utils/widgets/error_app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MainApp());
  ErrorWidget.builder = (_) => const AppErrorWidget();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: AppRouter.router,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            fontFamily: 'Roboto',
          ),
        );
      },
    );
  }
}
