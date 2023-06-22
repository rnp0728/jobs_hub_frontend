import 'dart:convert';

List<BookmarkReqInternshipModel> bookmarkReqModelFromJson(String str) =>
    List<BookmarkReqInternshipModel>.from(
        json.decode(str).map((x) => BookmarkReqInternshipModel.fromJson(x)));

String bookmarkReqModelToJson(List<BookmarkReqInternshipModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BookmarkReqInternshipModel {
  BookmarkReqInternshipModel({
    required this.internship,
  });

  final String internship;

  factory BookmarkReqInternshipModel.fromJson(Map<String, dynamic> json) =>
      BookmarkReqInternshipModel(
        internship: json["internship"],
      );

  Map<String, dynamic> toJson() => {
        "internship": internship,
      };
}
