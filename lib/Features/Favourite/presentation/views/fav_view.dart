import 'package:benta/Features/Favourite/presentation/views/widgets/test_fav_view_vodt.dart';
import 'package:benta/core/utils/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
      backgroundColor: Colors.white,
      body: TestFavViewVodt(),
    );
  }
}
