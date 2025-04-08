import 'package:benta/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key});

  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  final colors = [Color(0xFF9D9484), Color(0xFFFFB573), Color(0xFF004A56)];

  Color? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
            colors.map((color) {
              final isSelected = selectedColor == color;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColor = color;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  padding: EdgeInsets.all(3.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color:
                          isSelected ? kPrimaryColor : const Color(0xffC4C4C4),
                      width: 2.w,
                    ),
                  ),
                  child: Container(
                    width: 38.w,
                    height: 38.h,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
