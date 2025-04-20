import 'package:benta/Features/Cart/presentation/manager/add%20to%20cart%20cubit/add_to_cart_cubit.dart';
import 'package:benta/Features/Favourite/presentation/views/widgets/test_fav_view_body.dart';
import 'package:benta/core/utils/api_services.dart';
import 'package:benta/core/utils/widgets/custom_bottom_nav_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => AddToCartCubit(ApiServices(Dio())),
        child: TestFavViewBody(),
      ),
    );
  }
}
