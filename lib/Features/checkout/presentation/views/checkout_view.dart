import 'package:benta/Features/Profile/presentation/widgets/edit_profile_view_body.dart';
import 'package:benta/Features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:benta/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 40.h),
        child: Padding(
          padding: EdgeInsets.only(top: 40.h, left: 24.w, right: 24.w),
          child: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text('Place Order', style: Styles.style24medium),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
          ),
        ),
      ),
      body: CheckoutViewBody(),
    );
  }
}
