import 'package:benta/Features/Cart/presentation/widgets/custom_cart_container.dart';
import 'package:benta/Features/Cart/presentation/widgets/total_price_container.dart';
import 'package:benta/core/utils/constants.dart';
import 'package:benta/core/utils/widgets/custom_all_use_button.dart';
import 'package:benta/core/utils/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
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
      "price": 100.00,
    },
    {
      "title": "Sofa - bed",
      "image": 'assets/images/mandi-arm-chair-in-cream 2.png',
      "rate": 4.7,
      "price": 85.50,
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
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
                  return Dismissible(
                    background: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                      ),

                      alignment: Alignment.centerRight,
                      child: Icon(FontAwesome.trash_can, color: Colors.white),
                    ),
                    onDismissed: (direction) {
                      setState(() {
                        cartItems.removeAt(index);
                      });
                    },
                    key: UniqueKey(),
                    direction: DismissDirection.endToStart,

                    dismissThresholds: {DismissDirection.endToStart: 0.4},
                    child: CustomCartContainer(
                      title: item["title"],
                      image: item["image"],
                      rate: item["rate"],
                      price: item["price"].toString(),
                    ),
                  );
                },
              ),
              SizedBox(height: screenSize.height * 0.025),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TotalPriceContainer(
                  price: _calculateTotalPrice(),
                  itemsCount: cartItems.length,
                ),
              ),
              SizedBox(height: screenSize.height * 0.025),
              CustomAllUseButton(title: 'Check out', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
