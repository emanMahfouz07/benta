import 'package:benta/core/utils/constants.dart';
import 'package:benta/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

class FavouriteItemContainer extends StatefulWidget {
  final String title;
  final String price;
  final String rate;
  final String image;
  final bool isFavorite;
  final void Function() onFavChange;
  final VoidCallback onAddToCart;

  const FavouriteItemContainer({
    super.key,
    required this.title,
    required this.price,
    required this.rate,
    required this.image,
    required this.isFavorite,
    required this.onFavChange,
    required this.onAddToCart,
  });

  @override
  State<FavouriteItemContainer> createState() => _FavouriteItemContainerState();
}

class _FavouriteItemContainerState extends State<FavouriteItemContainer> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 14.0.h),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 120.h,
              decoration: BoxDecoration(
                color: kBGColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.r),
                  bottomLeft: Radius.circular(8.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isFavorite = !_isFavorite;
                      });
                      widget.onFavChange();
                    },
                    icon: Icon(
                      _isFavorite ? Icons.favorite : Icons.favorite_outline,
                      color: _isFavorite ? kPrimaryColor : Colors.grey,
                    ),
                  ),
                  Flexible(
                    child: Center(
                      child: Image.asset(widget.image, fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 120.h,
              decoration: BoxDecoration(
                color: kSecondryColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8.r),
                  bottomRight: Radius.circular(8.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          softWrap: true,
                          widget.title,
                          style: Styles.style16.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Icon(Icons.star, color: kPrimaryColor, size: 12.r),
                        SizedBox(width: 4.w),
                        Flexible(
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            "(${widget.rate})",

                            style: Styles.style12.copyWith(
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            "\$${widget.price}",
                            softWrap: true,

                            style: Styles.style18.copyWith(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Spacer(),
                        CircleAvatar(
                          radius: 18.r,
                          backgroundColor: kPrimaryColor,
                          child: IconButton(
                            icon: Icon(
                              BoxIcons.bx_plus,
                              size: 18.r,
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
            ),
          ),
        ],
      ),
    );
  }
}
