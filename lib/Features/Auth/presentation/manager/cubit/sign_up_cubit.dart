import 'package:benta/Features/Auth/data/models/sign_up_model.dart';
import 'package:benta/core/utils/api_services.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
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

      final user = UserSignUpModel.fromJson(response.data["data"]);
      emit(SignUpSuccess(user));

      if (response.data is Map && response.data["status"] == "error") {
        final errors = response.data["errors"];
        String errorMsg = "حدث خطأ ما";

        if (errors is Map && errors.isNotEmpty) {
          errorMsg = errors.values.first.toString();
        }

        emit(SignUpFailure(errorMsg));
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 409) {
        final data = e.response?.data;
        String errorMsg = "البريد الإلكتروني مسجل بالفعل";

        if (data.containsKey('message')) {
          errorMsg = data['message'] ?? "Unknown error occurred.";
        }

        emit(SignUpFailure(errorMsg));
      } else {
        print("Dio Error: ${e.response?.statusCode}");
        print("Dio Response Data: ${e.response?.data}");
      }
    }
  }
}
