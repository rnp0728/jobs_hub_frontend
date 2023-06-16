import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  final String userToken;
  final UserDetails userDetails;

  LoginResponseModel({
    required this.userToken,
    required this.userDetails,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        userToken: json["userToken"],
        userDetails: UserDetails.fromJson(json["userDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "userToken": userToken,
        "userDetails": userDetails.toJson(),
      };
}

class UserDetails {
  final String id;
  final String profile;
  final String userType;

  UserDetails({
    required this.id,
    required this.profile,
    required this.userType,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        id: json["_id"],
        profile: json["profile"],
        userType: json["userType"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "profile": profile,
        "userType": userType,
      };
}
