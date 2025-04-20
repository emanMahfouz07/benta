import 'package:benta/Features/Auth/presentation/manager/cubit/sign_up_cubit.dart';
import 'package:benta/Features/Auth/presentation/views/widgets/Sign_up_view_body.dart';
import 'package:benta/core/utils/api_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => SignUpCubit(ApiServices(Dio())),
        child: SignUpViewBody(),
      ),
    );
  }
}
