// To parse this JSON data, do
//
//     final jobsReqModel = jobsReqModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

JobsReqModel jobsReqModelFromJson(String str) =>
    JobsReqModel.fromJson(json.decode(str));

String jobsReqModelToJson(JobsReqModel data) => json.encode(data.toJson());

class JobsReqModel {
  final String title;
  final String location;
  final String email;
  final String company;
  final String description;
  final String salary;
  final String contract;
  final String period;
  final String imageUrl;
  final String agentId;
  final List<String> requirements;
  final List<dynamic> skillsRequired;

  JobsReqModel({
    required this.title,
    required this.location,
    required this.email,
    required this.company,
    required this.description,
    required this.salary,
    required this.contract,
    required this.period,
    required this.imageUrl,
    required this.agentId,
    required this.requirements,
    required this.skillsRequired,
  });

  factory JobsReqModel.fromJson(Map<String, dynamic> json) => JobsReqModel(
        title: json["title"],
        location: json["location"],
        email: json["email"],
        company: json["company"],
        description: json["description"],
        salary: json["salary"],
        contract: json["contract"],
        period: json["period"],
        imageUrl: json["imageUrl"],
        agentId: json["agentId"],
        requirements: List<String>.from(json["requirements"].map((x) => x)),
        skillsRequired:
            List<dynamic>.from(json["skillsRequired"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "location": location,
        "company": company,
        "email": email,
        "description": description,
        "salary": salary,
        "contract": contract,
        "period": period,
        "imageUrl": imageUrl,
        "agentId": agentId,
        "requirements": List<dynamic>.from(requirements.map((x) => x)),
        "skillsRequired": List<dynamic>.from(skillsRequired.map((x) => x)),
      };
}
