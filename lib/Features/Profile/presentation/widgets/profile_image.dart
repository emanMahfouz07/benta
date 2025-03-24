import 'dart:io';
import 'package:benta/Features/Profile/presentation/widgets/image_picker_bottom_sheet.dart';
import 'package:benta/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePicture extends StatefulWidget {
  const ProfilePicture({super.key});

  @override
  ProfilePictureState createState() => ProfilePictureState();
}

class ProfilePictureState extends State<ProfilePicture> {
  File? image;

  void _updateImage(File newImage) {
    setState(() {
      image = newImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 50.r,
          backgroundImage:
              image != null
                  ? FileImage(image!)
                  : const AssetImage('assets/images/Ellipse 1.png')
                      as ImageProvider,
        ),
        GestureDetector(
          onTap: () => showImagePickerBottomSheet(context, _updateImage),
          child: Container(
            padding: EdgeInsets.all(6.r),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: kPrimaryColor,
            ),
            child: Icon(Icons.camera_alt, color: kBGColor, size: 20.r),
          ),
        ),
      ],
    );
  }
}
