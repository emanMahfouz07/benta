import 'package:benta/Features/Notification/presentation/views/widgets/choose_notifiction_view_body.dart';
import 'package:benta/Features/Notification/presentation/views/widgets/custom_switch_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseNotificationView extends StatefulWidget {
  const ChooseNotificationView({super.key});

  @override
  ChooseNotificationViewState createState() => ChooseNotificationViewState();
}

class ChooseNotificationViewState extends State<ChooseNotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Notification'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ChooseNotifictionViewBody(),
    );
  }
}
