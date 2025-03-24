import 'package:benta/Features/Cart/presentation/widgets/my_cart_view_body.dart';
import 'package:benta/core/utils/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: MyCartViewBody(),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
