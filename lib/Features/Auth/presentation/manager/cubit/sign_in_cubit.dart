import 'package:benta/Features/Auth/data/models/sign_in_model.dart';
import 'package:benta/core/Errors/failure.dart';
import 'package:benta/core/utils/api_services.dart';
import 'package:benta/core/utils/shared_pref.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        final user = UserSignInModel.fromJson(response.data);

        if (!SharedPrefsHelper.isInitialized()) {
          await SharedPrefsHelper.init();
        }

        // ✅ Save ID and token first
        await SharedPrefsHelper.setUserId(user.user.id);
        await SharedPrefsHelper.setToken(response.data["token"]);

        // ✅ Now read and print
        print("Saving user ID: ${user.user.id}");
        print("Saved user ID: ${SharedPrefsHelper.getUserId()}");
        print("Saved token: ${SharedPrefsHelper.getToken()}");

        emit(SignInSuccess(user));
      } else {
        final errorMsg = response.data["message"] ?? "Failed to login";
        emit(SignInFailure(errorMsg));
      }
    } catch (e) {
      print("Error during sign in: $e");
      if (e is DioException) {
        final failure = ServerFailure.fromDioError(e);
        emit(SignInFailure(failure.errMessage));
      } else {
        emit(SignInFailure("An unexpected error occurred"));
      }
    }
  }
}
