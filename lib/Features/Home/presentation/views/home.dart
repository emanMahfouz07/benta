import 'package:benta/Features/Home/presentation/views/widgets/home_view_body.dart';
import 'package:benta/core/utils/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
      backgroundColor: Colors.white,
      body: HomeViewBody(),
    );
  }
}
