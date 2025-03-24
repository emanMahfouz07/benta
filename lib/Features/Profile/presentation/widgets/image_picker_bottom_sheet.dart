import 'dart:io';
import 'package:benta/Features/Profile/presentation/widgets/image_picker.dart';
import 'package:benta/core/utils/constants.dart';
import 'package:benta/core/utils/styles.dart';
import 'package:benta/core/utils/widgets/custom_border_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

void showImagePickerBottomSheet(
  BuildContext context,
  Function(File) onImageSelected, {
  Color backgroundColor = kPrimaryColor,
  Color iconColor = Colors.white,
}) {
  showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Profile photo',
                  style: Styles.style22.copyWith(fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Icon(Icons.delete, color: Color(0xff979797)),
              ],
            ),

            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _imageOption(
                  context,
                  Icons.camera_alt,
                  'Camera',
                  ImageSource.camera,
                  onImageSelected,
                  kPrimaryColor,
                  Colors.white,
                ),
                const SizedBox(width: 24),
                _imageOption(
                  context,
                  Icons.image,
                  'Gallery',
                  ImageSource.gallery,
                  onImageSelected,
                  Colors.white,
                  kPrimaryColor,
                ),
              ],
            ),
            const SizedBox(height: 16),
            CustomBorderButton(
              color: Colors.white,
              title: 'Cancel',
              onPressed: () {
                context.pop();
              },
            ),
          ],
        ),
      );
    },
  );
}

Widget _imageOption(
  BuildContext context,
  IconData icon,
  String title,
  ImageSource source,
  Function(File) onImageSelected,
  Color backgroundColor,
  Color iconColor,
) {
  return GestureDetector(
    onTap: () => pickImage(source, onImageSelected, context),
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: kPrimaryColor, width: 1),
          ),
          child: CircleAvatar(
            backgroundColor: backgroundColor,
            radius: 30,
            child: Icon(icon, color: iconColor, size: 28),
          ),
        ),
        const SizedBox(height: 8),
        Text(title, style: Styles.style16.copyWith(color: kPrimaryColor)),
      ],
    ),
  );
}
