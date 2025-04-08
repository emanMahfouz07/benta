part of 'sign_in_cubit.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {
  final UserSignInModel userSignInModel;
  SignInSuccess(this.userSignInModel);
}

class SignInFailure extends SignInState {
  final String failure;
  SignInFailure(this.failure);
}
