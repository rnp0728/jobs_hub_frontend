import 'dart:convert';

List<User> usersFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String usersToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  final String id;
  final String username;
  final String email;
  final String password;
  final bool isAdmin;
  final bool isAgent;
  final String userType;
  final List<String> skills;
  final String phone;
  final String profile;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.isAdmin,
    required this.isAgent,
    required this.userType,
    required this.skills,
    required this.phone,
    required this.profile,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        isAdmin: json["isAdmin"],
        isAgent: json["isAgent"],
        userType: json["userType"],
        skills: List<String>.from(json["skills"].map((x) => x)),
        phone: json["phone"],
        profile: json["profile"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
        "password": password,
        "isAdmin": isAdmin,
        "isAgent": isAgent,
        "userType": userType,
        "skills": List<dynamic>.from(skills.map((x) => x)),
        "phone": phone,
        "profile": profile,
      };
}
