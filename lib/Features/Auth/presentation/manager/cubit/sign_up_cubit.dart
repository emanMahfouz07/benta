import 'package:benta/Features/Auth/data/models/sign_up_model.dart';
import 'package:benta/core/Errors/server_error.dart';
import 'package:benta/core/utils/api_services.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.apiServices) : super(SignUpInitial());

  final ApiServices apiServices;

  Future<void> signUp(
    String name,
    String email,
    String phone,
    String address,
    String password,
  ) async {
    emit(SignUpLoading());
    try {
      final response = await apiServices.post(
        body: {
          'name': name,
          'password': password,
          'email': email,
          'phone': phone,
          'address': address,
        },
        endPoint: 'auth/register.php',
      );

      print("Response Data: ${response.data}");

      if (response.data["status"] == "error") {
        final errorMessage = ServerErrors.fromJson(response.data);
        emit(SignUpFailure(errorMessage));
        return;
      }

      final user = UserSignUpModel.fromJson(response.data["data"]);
      emit(SignUpSuccess(user));
    } catch (e) {
      print("SignUp Error: ${e.toString()}");
    }
  }
}
