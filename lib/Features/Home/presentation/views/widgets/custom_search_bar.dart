import 'package:benta/core/utils/constants.dart';
import 'package:benta/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    super.key,
    this.suffixIcon,
    this.customICon,
    this.onSearchChanged,
    this.controller,
    this.onSubmitted,
    this.onTap,
  });

  final IconData? suffixIcon;
  final IconData? customICon;
  final Function(String)? onSearchChanged;
  final TextEditingController? controller;
  final Function(String)? onSubmitted;
  final VoidCallback? onTap;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 16.h),
      decoration: BoxDecoration(
        color: const Color(0xffF1F4F4),
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              onTap: widget.onTap,
              onChanged: widget.onSearchChanged,
              onSubmitted: widget.onSubmitted,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: kLightGreyColor),
                suffixIcon:
                    widget.suffixIcon != null
                        ? IconButton(
                          icon: Icon(widget.suffixIcon),
                          color: kPrimaryColor,
                          onPressed: () {},
                        )
                        : null,
                hintText: "Search",
                border: InputBorder.none,
              ),
              style: Styles.style16.copyWith(color: kLightGreyColor),
            ),
          ),
          if (widget.customICon != null)
            IconButton(
              icon: Icon(widget.customICon, color: kPrimaryColor),
              onPressed: () {},
            ),
        ],
      ),
    );
  }
}
