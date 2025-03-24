import 'package:benta/Features/Profile/presentation/widgets/profile_view_body.dart';
import 'package:benta/core/utils/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: CustomBottomNavBar(),
      body: ProfileViewBody(),
    );
  }
}
