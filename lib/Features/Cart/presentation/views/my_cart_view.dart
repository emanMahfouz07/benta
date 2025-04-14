import 'package:benta/Features/Cart/presentation/manager/Cart%20Item/cart_item_cubit.dart';
import 'package:benta/Features/Cart/presentation/views/widgets/my_cart_view_body.dart';
import 'package:benta/core/utils/api_services.dart';
import 'package:benta/core/utils/widgets/custom_bottom_nav_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartItemCubit(ApiServices(Dio())),
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: MyCartViewBody(),
        bottomNavigationBar: CustomBottomNavBar(),
      ),
    );
  }
}
