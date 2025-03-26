class UserSignInModel {
  final String? username;
  final String? password;
  final String? token;

  UserSignInModel({
    required this.username,
    required this.password,
    required this.token,
  });
  factory UserSignInModel.fromJson(Map<String, dynamic>? json) {
    return UserSignInModel(
      username: json?['name'],
      password: json?['password'],
      token: json?['token'],
    );
  }
}
