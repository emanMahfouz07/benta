part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInLoading extends SignInState {}

final class SignInSuccess extends SignInState {
  final UserSignInModel userSignInModel;
  SignInSuccess(this.userSignInModel);
}

final class SignInFailure extends SignInState {
  final String error;
  SignInFailure(this.error);
}
