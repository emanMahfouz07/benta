import 'package:benta/Features/Auth/data/models/sign_in_model.dart';
import 'package:benta/core/utils/api_services.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.apiServices) : super(SignInInitial());

  final ApiServices apiServices;

  Future<void> signIn(String name, String password) async {
    emit(SignInLoading());
    try {
      final response = await apiServices.post(
        body: {'name': name, 'password': password},
        endPoint: 'auth/login.php',
      );

      print("Response Data: ${response.data}");

      if (response.statusCode == 200 && response.data["status"] == "success") {
        final user = UserSignInModel.fromJson(response.data["data"]);
        emit(SignInSuccess(user));
      } else {
        final errorMsg = response.data["message"] ?? "Failed to login";
        emit(SignInFailure(errorMsg));
      }
    } catch (e) {
      emit(SignInFailure("Error: ${e.toString()}"));
    }
  }
}
