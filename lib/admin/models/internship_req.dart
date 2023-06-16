import 'dart:convert';

InternshipReqModel internshipReqModelFromJson(String str) =>
    InternshipReqModel.fromJson(json.decode(str));

String internshipReqModelToJson(InternshipReqModel data) =>
    json.encode(data.toJson());

class InternshipReqModel {
  final String title;
  final String location;
  final String email;
  final String company;
  final String description;
  final String stipend;
  final String contract;
  final String duration;
  final String period;
  final String imageUrl;
  final String agentId;
  final List<String> requirements;
  final List<dynamic> skillsRequired;

  InternshipReqModel({
    required this.title,
    required this.location,
    required this.email,
    required this.company,
    required this.description,
    required this.stipend,
    required this.contract,
    required this.duration,
    required this.period,
    required this.imageUrl,
    required this.agentId,
    required this.requirements,
    required this.skillsRequired,
  });

  factory InternshipReqModel.fromJson(Map<String, dynamic> json) =>
      InternshipReqModel(
        title: json["title"],
        location: json["location"],
        email: json["email"],
        company: json["company"],
        description: json["description"],
        stipend: json["stipend"],
        contract: json["contract"],
        duration: json["duration"],
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
        "stipend": stipend,
        "contract": contract,
        "duration": duration,
        "period": period,
        "imageUrl": imageUrl,
        "agentId": agentId,
        "requirements": List<dynamic>.from(requirements.map((x) => x)),
        "skillsRequired": List<dynamic>.from(skillsRequired.map((x) => x)),
      };
}
