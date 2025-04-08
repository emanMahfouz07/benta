import 'package:benta/core/utils/constants.dart';
import 'package:benta/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallCounter extends StatefulWidget {
  const SmallCounter({super.key, this.onChanged});
  final ValueChanged<int>? onChanged; //

  @override
  State<SmallCounter> createState() => _SmallCounterState();
}

class _SmallCounterState extends State<SmallCounter> {
  int count = 1;

  void increment() {
    setState(() {
      count++;
    });
    widget.onChanged?.call(count);
  }

  void decrement() {
    if (count > 1) {
      setState(() {
        count--;
      });
      widget.onChanged?.call(count);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
        width: 60.w,
        height: 25.h,
        decoration: BoxDecoration(
          color: Color(0xff73888A),
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: increment,
              child: Container(
                width: 12.w,
                height: 10.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.r),
                  color: Colors.white,
                ),
                child: Icon(Icons.add, color: kPrimaryColor, size: 10),
              ),
            ),
            Text(
              '$count',
              style: Styles.style12.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            GestureDetector(
              onTap: decrement,
              child: Container(
                width: 12.w,
                height: 10.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.white,
                ),
                child: Icon(Icons.remove, color: kPrimaryColor, size: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
