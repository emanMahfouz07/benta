import 'package:benta/core/utils/app_router.dart';
import 'package:benta/core/utils/constants.dart';
import 'package:benta/core/utils/styles.dart';
import 'package:benta/core/utils/widgets/custom_all_use_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemInfoBottomSheet extends StatelessWidget {
  const ItemInfoBottomSheet({
    super.key,
    required this.imageList,
    required this.title,
    required this.desc,
    required this.price,
    this.onPressed,
  });

  final List<String> imageList;
  final String title;
  final String desc;
  final String price;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 382.h,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 51, right: 24, left: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(title, style: Styles.style24medium),
                SizedBox(width: 10),
                Icon(Icons.star, color: kPrimaryColor, size: 16),
                SizedBox(width: 5),
                Text(
                  "(4.5)",
                  style: Styles.style14.copyWith(color: kPrimaryColor),
                ),
                SizedBox(width: 10.w),
                Flexible(
                  child: Text(
                    softWrap: true,
                    maxLines: 1,
                    "\$$price",
                    style: Styles.style18.copyWith(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Text('Details', style: Styles.style16),
            Text(
              softWrap: true,
              desc,
              style: Styles.style14.copyWith(color: kLightGreyColor),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 70,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: imageList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              imageList[index],
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),

            CustomAllUseButton(title: 'Add to cart', onPressed: onPressed),
          ],
        ),
      ),
    );
  }
}
