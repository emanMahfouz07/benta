import 'package:benta/Features/Auth/presentation/manager/cubit/sign_in_cubit.dart';
import 'package:benta/Features/Auth/presentation/views/widgets/sign_in_body.dart';
import 'package:benta/core/utils/api_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => SignInCubit(ApiServices(Dio())),
        child: SignInViewBody(),
      ),
    );
  }
}
