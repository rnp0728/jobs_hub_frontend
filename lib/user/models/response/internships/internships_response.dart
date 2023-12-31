import 'dart:convert';

List<InternshipsResponse> internshipsResponseFromJson(String str) =>
    List<InternshipsResponse>.from(
        json.decode(str).map((x) => InternshipsResponse.fromJson(x)));

class InternshipsResponse {
  InternshipsResponse({
    required this.id,
    required this.title,
    required this.location,
    required this.company,
    required this.hiring,
    required this.description,
    required this.stipend,
    required this.period,
    required this.duration,
    required this.contract,
    required this.requirements,
    required this.skillsRequired,
    required this.imageUrl,
    required this.agentId,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String title;
  final String location;
  final String company;
  final bool hiring;
  final String description;
  final String stipend;
  final String period;
  final String duration;
  final String contract;
  final List<String> requirements;
  final List<String> skillsRequired;
  final String imageUrl;
  final String agentId;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory InternshipsResponse.fromJson(Map<String, dynamic> json) =>
      InternshipsResponse(
        id: json["_id"],
        title: json["title"],
        location: json["location"],
        company: json["company"],
        hiring: json["hiring"],
        description: json["description"],
        stipend: json["stipend"],
        duration: json["duration"],
        period: json["period"],
        contract: json["contract"],
        requirements: List<String>.from(json["requirements"].map((x) => x)),
        skillsRequired: List<String>.from(json["skillsRequired"].map((x) => x)),
        imageUrl: json["imageUrl"],
        agentId: json["agentId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );
}
