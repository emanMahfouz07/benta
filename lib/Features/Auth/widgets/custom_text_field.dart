import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.isPassword = false,
  });

  final String hintText;
  final bool isPassword;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      child: TextField(
        obscureText: widget.isPassword ? _isObscured : false,
        decoration: InputDecoration(
          hintText: widget.hintText,
          filled: true,
          fillColor: Color(0xffF1F4F4),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide.none,
          ),

          suffixIcon:
              widget.isPassword
                  ? IconButton(
                    icon: Icon(
                      _isObscured
                          ? Icons.remove_red_eye_outlined
                          : Icons.visibility_off,
                      color: Color(0xff787676),
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                  )
                  : null,
        ),
      ),
    );
  }
}
