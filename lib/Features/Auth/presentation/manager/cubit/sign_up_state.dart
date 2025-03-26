part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  final UserSignUpModel userSignUpModel;
  SignUpSuccess(this.userSignUpModel);
}

final class SignUpFailure extends SignUpState {
  final ServerErrors error;
  SignUpFailure(this.error);
}
