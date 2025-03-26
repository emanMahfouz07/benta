class UserSignUpModel {
  final String? username;
  final String? password;
  final String? email;
  final String? phone;
  final String? address;
  final String? token;

  UserSignUpModel({
    required this.email,
    required this.phone,
    required this.address,
    required this.username,
    required this.password,
    required this.token,
  });
  factory UserSignUpModel.fromJson(Map<String, dynamic>? json) {
    return UserSignUpModel(
      username: json?['name'],
      password: json?['password'],
      token: json?['token'],
      email: json?['email'],
      address: json?['address'],
      phone: json?['phone'],
    );
  }
}
