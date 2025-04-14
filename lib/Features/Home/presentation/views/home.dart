import 'package:benta/Features/Cart/presentation/manager/add%20to%20cart%20cubit/add_to_cart_cubit.dart';
import 'package:benta/Features/Home/presentation/manager/cubit/get_item_cubit.dart';
import 'package:benta/Features/Home/presentation/views/widgets/home_view_body.dart';
import 'package:benta/core/utils/api_services.dart';
import 'package:benta/core/utils/widgets/custom_bottom_nav_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetItemCubit(ApiServices(Dio()))),
        BlocProvider(create: (_) => AddToCartCubit(ApiServices(Dio()))),
      ],
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavBar(),
        backgroundColor: Colors.white,
        body: HomeViewBody(),
      ),
    );
  }
}
