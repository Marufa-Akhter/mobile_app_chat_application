class UserModel {
  final String username;
  final String email;
  final String avatarUrl;

  UserModel({
    required this.username,
    required this.email,
    required this.avatarUrl,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'],
      email: map['email'],
      avatarUrl: map['avatarUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'avatarUrl': avatarUrl,
    };
  }
}
