import 'package:benta/Features/Cart/presentation/widgets/Item_info_bottom_sheet.dart';
import 'package:benta/Features/Cart/presentation/widgets/custom_color_picker.dart';
import 'package:benta/Features/Cart/presentation/widgets/custom_counter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemInfoViewBody extends StatelessWidget {
  const ItemInfoViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> imageList = [
      'assets/images/Rectangle 47.png',
      'assets/images/Rectangle 48.png',
    ];
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
                Spacer(),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_outline),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                CustomColorPicker(),
                Spacer(flex: 1),
                Image.asset('assets/images/mandi-arm-chair-in-cream 1.png'),
                Spacer(flex: 3),
              ],
            ),
            CustomCounter(),
            ItemInfoBottomSheet(imageList: imageList),
          ],
        ),
      ),
    );
  }
}
