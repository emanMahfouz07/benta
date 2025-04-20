import 'package:benta/Features/Cart/presentation/manager/add%20to%20cart%20cubit/add_to_cart_cubit.dart';
import 'package:benta/Features/Home/presentation/manager/all%20Products%20Cubit/all_products_cubit.dart';
import 'package:benta/Features/Home/presentation/views/widgets/all_product_view_body.dart';
import 'package:benta/core/utils/api_services.dart';
import 'package:benta/core/utils/styles.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AllProductsView extends StatelessWidget {
  const AllProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        title: Text('All Products', style: Styles.style22),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AllProductsCubit(ApiServices(Dio())),
          ),
          BlocProvider(create: (context) => AddToCartCubit(ApiServices(Dio()))),
        ],

        child: const AllProductViewBody(),
      ),
    );
  }
}
