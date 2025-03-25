import 'package:benta/Features/Auth/presentation/views/widgets/custom_text_field.dart';
import 'package:benta/Features/Profile/presentation/widgets/profile_image.dart';
import 'package:benta/core/utils/styles.dart';
import 'package:benta/core/utils/widgets/custom_all_use_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40.h),
            ProfilePicture(),

            SizedBox(height: 24.h),
            const CustomTextField(hintText: 'Full Name'),

            SizedBox(height: 16.h),

            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 14.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Colors.grey.shade200,
                  ),
                  child: Row(
                    children: [
                      Text('🇪🇬 +20', style: Styles.style16),
                      SizedBox(width: 8.w),
                      Icon(Icons.arrow_drop_down, color: Colors.black54),
                    ],
                  ),
                ),
                SizedBox(width: 12.w),
                const Expanded(child: CustomTextField(hintText: 'Phone')),
              ],
            ),

            const SizedBox(height: 16),

            const CustomTextField(hintText: 'Email'),

            const SizedBox(height: 16),

            const CustomTextField(hintText: 'Address'),

            const SizedBox(height: 32),

            CustomAllUseButton(title: 'Save', onPressed: () {}),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
