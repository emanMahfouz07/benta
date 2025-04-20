import 'package:benta/Features/Cart/presentation/manager/add%20to%20cart%20cubit/add_to_cart_cubit.dart';
import 'package:benta/Features/Cart/presentation/manager/cubit/product_cubit.dart';
import 'package:benta/Features/Cart/presentation/views/widgets/item_info_view_body.dart';
import 'package:benta/core/utils/api_services.dart';
import 'package:benta/core/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ItemInfoView extends StatelessWidget {
  const ItemInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final id = (GoRouterState.of(context).extra as Map)['id'] as int;

    return Scaffold(
      backgroundColor: kBGColor,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ProductCubit(ApiServices(Dio()))),
          BlocProvider(create: (context) => AddToCartCubit(ApiServices(Dio()))),
        ],
        child: ItemInfoViewBody(productId: id),
      ),
    );
  }
}
