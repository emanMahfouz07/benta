import 'package:benta/Features/Home/presentation/manager/categoryFilterCubit/category_filter_cubit_cubit.dart';
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
    return BlocProvider(
      create: (_) => GetItemCubit(ApiServices(Dio())),
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavBar(),
        backgroundColor: Colors.white,
        body: HomeViewBody(),
      ),
    );
  }
}
