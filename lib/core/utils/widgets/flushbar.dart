import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Flushbar<dynamic> showFlashbar() {
  return Flushbar(
    message: "Item added to cart!",
    backgroundColor: Colors.green,
    icon: Icon(Icons.check_circle, color: Colors.white),
    duration: Duration(seconds: 2),
    margin: EdgeInsets.all(8.r),
    borderRadius: BorderRadius.circular(8),
    flushbarPosition: FlushbarPosition.BOTTOM,
    isDismissible: true,
  );
}
