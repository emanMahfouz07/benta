import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final ImagePicker _picker = ImagePicker();

Future<void> pickImage(
  ImageSource source,
  Function(File) onImageSelected,
  BuildContext context,
) async {
  final XFile? pickedFile = await _picker.pickImage(source: source);
  if (pickedFile != null) {
    onImageSelected(File(pickedFile.path));
  }
  Navigator.pop(context);
}
