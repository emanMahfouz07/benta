class UserSignInModel {
  final String status;
  final String message;
  final User user;
  final String token;

  UserSignInModel({
    required this.status,
    required this.message,
    required this.user,
    required this.token,
  });

  factory UserSignInModel.fromJson(Map<String, dynamic>? json) {
    return UserSignInModel(
      status: json?['status'] ?? '', // Default empty string if null
      message: json?['message'] ?? '', // Default empty string if null
      user: User.fromJson(json?['user']),
      token: json?['token'] ?? '', // Default empty string if null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'user': user.toJson(),
      'token': token,
    };
  }
}

class User {
  final int id;
  final String name;

  User({required this.id, required this.name});

  factory User.fromJson(Map<String, dynamic>? json) {
    return User(id: json?['id'] ?? 0, name: json?['name'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
