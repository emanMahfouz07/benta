import 'package:benta/Features/Auth/widgets/rest_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RestPasswordView extends StatelessWidget {
  const RestPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      backgroundColor: Colors.white,
      body: ResetPasswordViewBody(),
    );
  }
}
