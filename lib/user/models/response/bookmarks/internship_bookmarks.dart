import 'dart:convert';

List<AllInternshipBookmarks> allInternshipBookmarksFromJson(String str) =>
    List<AllInternshipBookmarks>.from(
        json.decode(str).map((x) => AllInternshipBookmarks.fromJson(x)));

class AllInternshipBookmarks {
  final String id;
  final Internship? internship;
  final String userId;

  AllInternshipBookmarks({
    required this.id,
    this.internship,
    required this.userId,
  });

  factory AllInternshipBookmarks.fromJson(Map<String, dynamic> json) {
    return AllInternshipBookmarks(
      id: json["_id"],
      internship: json["internship"] != null
          ? Internship.fromJson(json["internship"])
          : null,
      userId: json["userId"],
    );
  }
}

class Internship {
  final String id;
  final String title;
  final String location;
  final String company;
  final String stipend;
  final String period;
  final String contract;
  final String imageUrl;
  final String agentId;

  Internship({
    required this.id,
    required this.title,
    required this.location,
    required this.company,
    required this.stipend,
    required this.period,
    required this.contract,
    required this.imageUrl,
    required this.agentId,
  });

  factory Internship.fromJson(Map<String, dynamic> json) => Internship(
        id: json["_id"],
        title: json["title"],
        location: json["location"],
        company: json["company"],
        stipend: json["stipend"],
        period: json["period"],
        contract: json["contract"],
        imageUrl: json["imageUrl"],
        agentId: json["agentId"],
      );
}
