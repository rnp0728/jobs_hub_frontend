import 'dart:convert';

List<CoursesResponse> coursesResponseFromJson(String str) =>
    List<CoursesResponse>.from(
        json.decode(str).map((x) => CoursesResponse.fromJson(x)));

class CoursesResponse {
  CoursesResponse({
    required this.id,
    required this.title,
    required this.instructor,
    required this.rating,
    required this.price,
    required this.availableIn,
    required this.imageUrl,
    required this.webAddress,
  });

  final String id;
  final String title;
  final String instructor;
  final num rating;
  final num price;
  final String availableIn;
  final String imageUrl;
  final String webAddress;

  factory CoursesResponse.fromJson(Map<String, dynamic> json) =>
      CoursesResponse(
        id: json["_id"],
        title: json["title"],
        instructor: json["instructor"],
        rating: json["rating"],
        price: json["price"],
        availableIn: json["availableIn"],
        imageUrl: json["imageUrl"],
        webAddress: json["webAddress"],
      );
}
