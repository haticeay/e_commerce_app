import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        password: json['password'],
        confirmPassword: json['confirmPassword'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'password': password,
        'confirmPassword': confirmPassword,
      };

  static String encodeList(List<User> users) =>
      json.encode(users.map((u) => u.toJson()).toList());

  static List<User> decodeList(String usersString) =>
      (json.decode(usersString) as List)
          .map((item) => User.fromJson(item))
          .toList();
}
