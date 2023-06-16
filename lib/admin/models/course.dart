import 'dart:convert';

Course courseFromJson(String str) => Course.fromJson(json.decode(str));

String courseToJson(Course data) => json.encode(data.toJson());

class Course {
  final String title;
  final String instructor;
  final num rating;
  final num price;
  final String availableIn;
  final String imageUrl;
  final String webAddress;

  Course({
    required this.title,
    required this.instructor,
    required this.rating,
    required this.price,
    required this.availableIn,
    required this.imageUrl,
    required this.webAddress,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
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
