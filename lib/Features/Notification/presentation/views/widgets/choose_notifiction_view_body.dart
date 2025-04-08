import 'package:benta/Features/Notification/presentation/views/widgets/custom_switch_button.dart';
import 'package:flutter/material.dart';

class ChooseNotifictionViewBody extends StatefulWidget {
  const ChooseNotifictionViewBody({super.key});

  @override
  State<ChooseNotifictionViewBody> createState() =>
      _ChooseNotifictionViewBodyState();
}

class _ChooseNotifictionViewBodyState extends State<ChooseNotifictionViewBody> {
  bool generalNotification = true;
  bool vibrate = true;
  bool sound = true;
  bool offer = true;
  bool paymentRequest = true;
  bool update = true;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
