import 'package:benta/Features/Profile/presentation/widgets/custom_logout_dialog.dart';
import 'package:benta/Features/Profile/presentation/widgets/custom_navigation_tile.dart';
import 'package:benta/core/utils/app_router.dart';
import 'package:benta/core/utils/constants.dart';
import 'package:benta/core/utils/helper_class.dart';
import 'package:benta/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Text('Profile', style: Styles.style24medium),
              SizedBox(height: 30.h),
              Row(
                children: [
                  Image.asset(
                    'assets/images/Ellipse 1.png',
                    height: 70.h,
                    width: 70.w,
                  ),
                  SizedBox(width: 8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Omar Ali', style: Styles.style22),
                      Text(
                        'OmarAli2000@gmail.com',
                        style: Styles.style14.copyWith(color: kLightGreyColor),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      context.push(AppRouter.kEditProfileView);
                    },
                    icon: Icon(FontAwesome.pen_to_square, color: kPrimaryColor),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Divider(color: Color(0xffD8D8D8)),
              CustomNavigationTile(
                icon: Icons.history,
                title: 'History of order',
                onTap: () {
                  context.pushReplacement(AppRouter.kOrderView);
                },
              ),
              CustomNavigationTile(
                icon: FontAwesome.credit_card,
                title: 'Payment methods',
              ),
              CustomNavigationTile(
                icon: Icons.notifications,
                title: 'Notifications',
                onTap: () {},
              ),
              CustomNavigationTile(
                icon: FontAwesome.award_solid,
                title: 'Reward card',
              ),
              CustomNavigationTile(icon: Icons.code, title: 'Promo code'),
              CustomNavigationTile(
                icon: Icons.privacy_tip,
                title: 'Privacy & policy',
              ),
              CustomNavigationTile(icon: Icons.language, title: 'Language'),
              CustomNavigationTile(icon: Icons.help, title: 'Help'),

              ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: Icon(Icons.share, color: kPrimaryColor),
                title: Text('Share', style: Styles.style18),
                onTap: () {
                  HelperClass.shareApp();
                },
                trailing: Icon(Icons.arrow_forward_ios, size: 20.r),
              ),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: Icon(Icons.logout, color: kPrimaryColor),
                title: Text('Log Out', style: Styles.style18),
                onTap: () {
                  customLogoutDialog(context);
                },
                trailing: Icon(Icons.arrow_forward_ios, size: 20.r),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
