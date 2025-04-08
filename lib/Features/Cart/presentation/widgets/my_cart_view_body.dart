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
  List<double> itemTotals = [];

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
    return itemTotals.fold(0, (sum, item) => sum + item);
  }

  @override
  void initState() {
    super.initState();
    itemTotals =
        cartItems.map((item) {
          return (double.tryParse(item['price']) ?? 0) * (item['count'] ?? 1);
        }).toList();
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
                  return Slidable(
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

                      onTotalChanged: (newTotal) {
                        setState(() {
                          itemTotals[index] = newTotal;
                        });
                      },
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
