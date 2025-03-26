import 'package:benta/Features/Cart/presentation/widgets/custom_cart_container.dart';
import 'package:benta/Features/Cart/presentation/widgets/total_price_container.dart';
import 'package:benta/core/utils/constants.dart';
import 'package:benta/core/utils/widgets/custom_all_use_button.dart';
import 'package:benta/core/utils/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:icons_plus/icons_plus.dart';

class MyCartViewBody extends StatefulWidget {
  const MyCartViewBody({super.key});

  @override
  State<MyCartViewBody> createState() => _MyCartViewBodyState();
}

class _MyCartViewBodyState extends State<MyCartViewBody> {
  final List<Map<String, dynamic>> cartItems = [
    {
      "title": "Modern Chair",
      "image": 'assets/images/mandi-arm-chair-in-cream 2.png',
      "rate": 4.5,
      "price": '100.00',
    },
    {
      "title": "Sofa - bed",
      "image": 'assets/images/mandi-arm-chair-in-cream 2.png',
      "rate": 4.7,
      "price": '85.50',
    },
  ];
  double _calculateTotalPrice() {
    return cartItems.fold(
      0,
      (sum, item) => sum + double.tryParse(item["price"].toString())!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppBar(title: 'My Cart'),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Container(
                    constraints: BoxConstraints(minHeight: 120.h),
                    child: Slidable(
                      key: ValueKey(index),
                      endActionPane: ActionPane(
                        motion: ScrollMotion(),
                        extentRatio: 0.2,
                        children: [
                          SlidableAction(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8.r),
                              bottomRight: Radius.circular(8.r),
                            ),
                            onPressed: (context) {
                              setState(() {
                                cartItems.removeAt(index);
                              });
                            },
                            backgroundColor: kPrimaryColor,
                            foregroundColor: Colors.white,
                            icon: FontAwesome.trash_can,
                          ),
                        ],
                      ),
                      child: CustomCartContainer(
                        title: item["title"],
                        image: item["image"],
                        rate: item["rate"],
                        price: item["price"],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 25.h),
              Padding(
                padding: EdgeInsets.all(8.r),
                child: TotalPriceContainer(
                  price: _calculateTotalPrice(),
                  itemsCount: cartItems.length,
                ),
              ),
              SizedBox(height: 25.h),
              CustomAllUseButton(title: 'Check out', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
