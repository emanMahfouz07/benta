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
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40.h),
            ProfilePicture(),

            SizedBox(height: 24.h),
            CustomTextField(hintText: 'Full Name', controller: nameController),

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
                Expanded(
                  child: CustomTextField(
                    hintText: 'Phone',
                    controller: phoneController,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            CustomTextField(hintText: 'Email', controller: emailController),

            const SizedBox(height: 16),

            CustomTextField(hintText: 'Address', controller: addressController),

            const SizedBox(height: 32),

            CustomAllUseButton(title: 'Save', onPressed: () {}),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
