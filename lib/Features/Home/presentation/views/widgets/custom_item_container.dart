import 'package:benta/core/utils/app_router.dart';
import 'package:benta/core/utils/constants.dart';
import 'package:benta/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';

class CustomItemContainer extends StatefulWidget {
  const CustomItemContainer({
    super.key,
    required this.title,
    required this.price,
    required this.rate,
    required this.image,
    required this.onFavoriteChanged,

    required this.onAddToCart,
    required this.isFavorite,
    required this.id,
  });

  final String title;
  final String price;
  final String rate;
  final String image;
  final bool isFavorite;
  final Function(bool) onFavoriteChanged;
  final VoidCallback onAddToCart;
  final int id;

  @override
  State<CustomItemContainer> createState() => _CustomItemContainerState();
}

class _CustomItemContainerState extends State<CustomItemContainer> {
  late bool _isFavorite;
  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  @override
  void didUpdateWidget(CustomItemContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isFavorite != widget.isFavorite) {
      _isFavorite = widget.isFavorite;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 14.w),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              context.push(AppRouter.kItemInfoView, extra: {'id': widget.id});
            },
            child: Container(
              width: 127.w,
              height: 124.h,
              decoration: BoxDecoration(
                color: kBGColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 8.h,
                    right: 8.w,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isFavorite = !_isFavorite;
                        });
                        widget.onFavoriteChanged(_isFavorite);
                      },
                      child: CircleAvatar(
                        radius: 17,
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: Icon(
                            _isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: _isFavorite ? Colors.red : kPrimaryColor,
                            size: 18,
                          ),
                          onPressed: () {
                            setState(() {
                              _isFavorite = !_isFavorite;
                            });
                            widget.onFavoriteChanged(_isFavorite);
                          },
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Image.network(widget.image, fit: BoxFit.contain),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 127.w,
            height: 68.h,
            padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h),
            decoration: BoxDecoration(
              color: Color(0xffD4DDDD),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.r),
                bottomRight: Radius.circular(10.r),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Styles.style14.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Icon(Icons.star, color: kPrimaryColor, size: 14),
                    SizedBox(width: 3.w),
                    Text(
                      "(${widget.rate})",
                      style: Styles.style10.copyWith(color: kPrimaryColor),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${widget.price}",
                      style: Styles.style14.copyWith(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CircleAvatar(
                      radius: 14.r,
                      backgroundColor: kPrimaryColor,
                      child: IconButton(
                        icon: Icon(
                          BoxIcons.bx_plus,
                          size: 13.r,
                          color: Colors.white,
                        ),
                        onPressed: widget.onAddToCart,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
