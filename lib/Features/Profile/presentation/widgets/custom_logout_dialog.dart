import 'package:benta/core/utils/app_router.dart';
import 'package:benta/core/utils/shared_pref.dart';
import 'package:benta/core/utils/styles.dart';
import 'package:benta/core/utils/widgets/custom_all_use_button.dart';
import 'package:benta/core/utils/widgets/custom_border_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void customLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          'Log out',
          style: Styles.style22,
          textAlign: TextAlign.center,
        ),
        content: Text(
          'Are you sure you want to\nlog out?',
          style: Styles.style16,

          textAlign: TextAlign.center,
        ),
        actions: [
          CustomBorderButton(
            title: 'Log out',
            color: Color(0xffFFFFFF),
            onPressed: () async {
              await SharedPrefsHelper.clearAll();
              context.pushReplacement(AppRouter.kLoginView);
            },
          ),
          SizedBox(height: 15),
          CustomAllUseButton(
            title: 'Cancel',
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
