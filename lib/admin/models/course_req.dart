import 'dart:convert';

CourseReqModel courseReqModelFromJson(String str) =>
    CourseReqModel.fromJson(json.decode(str));

String courseReqModelToJson(CourseReqModel data) => json.encode(data.toJson());

class CourseReqModel {
  final String title;
  final String instructor;
  final num rating;
  final num price;
  final String availableIn;
  final String imageUrl;
  final String webAddress;

  CourseReqModel({
    required this.title,
    required this.instructor,
    required this.rating,
    required this.price,
    required this.availableIn,
    required this.imageUrl,
    required this.webAddress,
  });

  factory CourseReqModel.fromJson(Map<String, dynamic> json) => CourseReqModel(
        title: json["title"],
        instructor: json["instructor"],
        rating: json["rating"],
        price: json["price"],
        availableIn: json["availableIn"],
        imageUrl: json["imageUrl"],
        webAddress: json["webAddress"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "instructor": instructor,
        "price": price,
        "rating": rating,
        "availableIn": availableIn,
        "imageUrl": imageUrl,
        "webAddress": webAddress,
      };
}
