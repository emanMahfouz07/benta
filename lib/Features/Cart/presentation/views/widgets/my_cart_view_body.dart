import 'package:benta/Features/Cart/data/models/cart_item.dart';
import 'package:benta/Features/Cart/presentation/manager/Cart%20Item/cart_item_cubit.dart';
import 'package:benta/Features/Cart/presentation/views/widgets/custom_cart_container.dart';
import 'package:benta/Features/Cart/presentation/views/widgets/total_price_container.dart';
import 'package:benta/core/utils/api_services.dart';
import 'package:benta/core/utils/constants.dart';
import 'package:benta/core/utils/widgets/custom_all_use_button.dart';
import 'package:benta/core/utils/widgets/custom_app_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyCartViewBody extends StatefulWidget {
  const MyCartViewBody({super.key});

  @override
  State<MyCartViewBody> createState() => _MyCartViewBodyState();
}

class _MyCartViewBodyState extends State<MyCartViewBody> {
  @override
  void initState() {
    super.initState();
    _initCart();
  }

  Future<void> _initCart() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('user_id');

    if (userId != null) {
      context.read<CartItemCubit>().getCartItems(userId: userId);
    } else {
      print('⚠️ User ID not found in SharedPreferences');
      // Optionally show a label/snackbar or navigate to login
    }
  }

  double _calculateTotalPrice(List<CartItem> items) {
    return items.fold(0.0, (sum, item) {
      final price = double.tryParse(item.price) ?? 0.0;
      return sum + (price * item.quantity);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(title: 'My Cart'),
              BlocBuilder<CartItemCubit, CartItemState>(
                builder: (context, state) {
                  if (state is CartItemLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CartItemFailure) {
                    return Center(child: Text(state.message));
                  } else if (state is CartItemSuccess) {
                    final cartItems = state.cartItems;
                    return Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cartItems.length,
                          itemBuilder: (context, index) {
                            final item = cartItems[index];
                            return Slidable(
                              key: ValueKey(item.id),
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                extentRatio: 0.2,
                                children: [
                                  SlidableAction(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(8.r),
                                      bottomRight: Radius.circular(8.r),
                                    ),
                                    onPressed: (_) async {},
                                    backgroundColor: kPrimaryColor,
                                    foregroundColor: Colors.white,
                                    icon: FontAwesome.trash_can,
                                  ),
                                ],
                              ),
                              child: CustomCartContainer(
                                title: item.name,
                                image:
                                    'assets/images/mandi-arm-chair-in-cream 2.png',
                                rate: 4.4,
                                price: item.price,

                                onTotalChanged: (newTotal) {},
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 25.h),
                        Padding(
                          padding: EdgeInsets.all(8.r),
                          child: TotalPriceContainer(
                            price: _calculateTotalPrice(cartItems),
                            itemsCount: cartItems.length,
                          ),
                        ),
                        SizedBox(height: 25.h),
                        CustomAllUseButton(
                          title: 'Check out',
                          onPressed: () {},
                        ),
                      ],
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
