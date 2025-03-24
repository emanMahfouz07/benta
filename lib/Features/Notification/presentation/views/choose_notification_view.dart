import 'package:benta/Features/Notification/presentation/views/widgets/custom_switch_button.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  NotificationScreenState createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen> {
  bool generalNotification = true;
  bool vibrate = true;
  bool sound = true;
  bool offer = true;
  bool paymentRequest = true;
  bool update = true;

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
      body: Column(
        children: [
          CustomSwitchButton(
            title: 'General notification',
            value: generalNotification,
            onChanged: (val) => setState(() => generalNotification = val),
          ),
          CustomSwitchButton(
            title: 'Vibrate',
            value: vibrate,
            onChanged: (val) => setState(() => vibrate = val),
          ),
          CustomSwitchButton(
            title: 'Sound',
            value: sound,
            onChanged: (val) => setState(() => sound = val),
          ),
          CustomSwitchButton(
            title: 'Offer',
            value: offer,
            onChanged: (val) => setState(() => offer = val),
          ),
          CustomSwitchButton(
            title: 'Payment request',
            value: paymentRequest,
            onChanged: (val) => setState(() => paymentRequest = val),
          ),
          CustomSwitchButton(
            title: 'Update',
            value: update,
            onChanged: (val) => setState(() => update = val),
          ),
        ],
      ),
    );
  }
}
