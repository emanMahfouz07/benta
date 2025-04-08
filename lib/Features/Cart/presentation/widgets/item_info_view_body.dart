import 'package:benta/Features/Cart/presentation/widgets/Item_info_bottom_sheet.dart';
import 'package:benta/Features/Cart/presentation/widgets/custom_color_picker.dart';
import 'package:benta/Features/Cart/presentation/widgets/custom_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:imageview360/imageview360.dart';

class ItemInfoViewBody extends StatefulWidget {
  const ItemInfoViewBody({super.key});

  @override
  State<ItemInfoViewBody> createState() => _ItemInfoViewBodyState();
}

class _ItemInfoViewBodyState extends State<ItemInfoViewBody> {
  List<ImageProvider> imageList = [];

  @override
  void initState() {
    super.initState();
    loadImages();
  }

  void loadImages() {
    List<ImageProvider> images = [];
    for (int i = 1; i <= 52; i++) {
      images.add(AssetImage('assets/sample/$i.png'));
    }
    setState(() {
      imageList = images;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> smallImageList = [
      'assets/images/Rectangle 47.png',
      'assets/images/Rectangle 48.png',
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 40.h, left: 24.w, right: 24.w),
        child: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,

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
                      ColorPicker(),

                      Center(
                        child: SizedBox(
                          width: 250.w,
                          height: 340.h,
                          child: ImageView360(
                            key: UniqueKey(),
                            imageList: imageList,
                            autoRotate: true,
                            rotationCount: 2,
                            swipeSensitivity: 2,
                          ),
                        ),
                      ),
                    ],
                  ),

                  ItemInfoBottomSheet(imageList: smallImageList),
                ],
              ),
              CustomCounter(),
            ],
          ),
        ),
      ),
    );
  }
}
