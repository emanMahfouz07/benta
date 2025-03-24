import 'package:benta/core/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomNavigationTile extends StatelessWidget {
  const CustomNavigationTile({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });
  final IconData icon;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: Icon(icon, color: kPrimaryColor),
      title: Text(title),
      onTap: onTap,
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 20,
        color: Color(0xff575757),
      ),
    );
  }
}
