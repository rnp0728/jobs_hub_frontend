import 'dart:convert';

SignupModel signupModelFromJson(String str) =>
    SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
  SignupModel({
    required this.username,
    required this.email,
    required this.password,
    required this.userType,
    required this.isAgent,
  });

  final String username;
  final String email;
  final String password;
  final String userType;
  final bool isAgent;

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        username: json["username"],
        email: json["email"],
        password: json["password"],
        userType: json["userType"],
        isAgent: json["isAgent"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
        "userType": userType,
        "isAgent": isAgent,
      };
}
