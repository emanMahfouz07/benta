import 'package:benta/core/utils/constants.dart';
import 'package:benta/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

class CategoryFilter extends StatefulWidget {
  const CategoryFilter({super.key});

  @override
  CategoryFilterState createState() => CategoryFilterState();
}

class CategoryFilterState extends State<CategoryFilter> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> categories = [
    {"icon": null, "label": "All"},
    {"icon": Icons.event_seat_outlined, "label": "Chair"},
    {"icon": Icons.chair_outlined, "label": "Sofa"},
    {"icon": Icons.desk_outlined, "label": "Desk"},
    {"icon": Icons.table_chart, "label": "Table"},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          bool isSelected = selectedIndex == index;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: isSelected ? kPrimaryColor : Color(0xffF1F4F4),
                  borderRadius: BorderRadius.circular(100.r),
                  border: isSelected ? null : Border.all(color: kPrimaryColor),
                ),
                child: Row(
                  children: [
                    if (categories[index]["icon"] != null) ...[
                      Icon(
                        categories[index]["icon"],
                        size: 14,
                        color: isSelected ? Colors.white : kPrimaryColor,
                      ),
                      SizedBox(width: 8.w),
                    ],

                    Text(
                      categories[index]["label"],
                      style: Styles.style14.copyWith(
                        color: isSelected ? Colors.white : kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
