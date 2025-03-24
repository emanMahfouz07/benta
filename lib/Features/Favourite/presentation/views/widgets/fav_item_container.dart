import 'package:benta/Features/Cart/presentation/widgets/small_counter.dart';
import 'package:benta/core/utils/constants.dart';
import 'package:benta/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class FavouriteItemContainer extends StatelessWidget {
  const FavouriteItemContainer({
    super.key,
    required this.title,
    required this.image,
    required this.rate,
    required this.price,
  });
  final String title;
  final String image;
  final double rate;
  final String price;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: screenSize.height * 0.18,

              decoration: BoxDecoration(
                color: kBGColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_outline),
                  ),
                  Flexible(child: Center(child: Image.asset(image))),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: screenSize.height * 0.18,
              decoration: BoxDecoration(
                color: kSecondryColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Spacer(),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            softWrap: true,
                            title,
                            style: Styles.style16.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.star, color: kPrimaryColor, size: 12),
                        SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            "($rate)",
                            style: Styles.style12.copyWith(
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            "\$$price",
                            softWrap: true,
                            style: Styles.style18.copyWith(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Spacer(),
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: kPrimaryColor,
                          child: Icon(
                            BoxIcons.bx_plus,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
