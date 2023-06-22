import 'dart:convert';

GetInternshipRes getInternshipResFromJson(String str) =>
    GetInternshipRes.fromJson(json.decode(str));

String getInternshipResToJson(GetInternshipRes data) =>
    json.encode(data.toJson());

class GetInternshipRes {
  GetInternshipRes({
    required this.id,
    required this.title,
    required this.location,
    required this.company,
    required this.email,
    required this.hiring,
    required this.description,
    required this.stipend,
    required this.duration,
    required this.period,
    required this.contract,
    required this.requirements,
    required this.skillsRequired,
    required this.imageUrl,
    required this.agentId,
  });

  final String id;
  final String title;
  final String location;
  final String company;
  final String email;
  final bool hiring;
  final String description;
  final String stipend;
  final String duration;
  final String period;
  final String contract;
  final List<String> requirements;
  final List<String> skillsRequired;
  final String imageUrl;
  final String agentId;

  factory GetInternshipRes.fromJson(Map<String, dynamic> json) =>
      GetInternshipRes(
          id: json["_id"],
          title: json["title"],
          location: json["location"],
          company: json["company"],
          email: json["email"],
          hiring: json["hiring"],
          duration: json["duration"],
          description: json["description"],
          stipend: json["stipend"],
          period: json["period"],
          contract: json["contract"],
          requirements: List<String>.from(json["requirements"].map((x) => x)),
          skillsRequired:
              List<String>.from(json["skillsRequired"].map((x) => x)),
          imageUrl: json["imageUrl"],
          agentId: json["agentId"]);

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "location": location,
        "company": company,
        "email": email,
        "hiring": hiring,
        "duration": duration,
        "description": description,
        "stipend": stipend,
        "period": period,
        "contract": contract,
        "requirements": List<dynamic>.from(requirements.map((x) => x)),
        "skillsRequired": List<dynamic>.from(skillsRequired.map((x) => x)),
        "imageUrl": imageUrl,
        "agentId": agentId,
      };
}
