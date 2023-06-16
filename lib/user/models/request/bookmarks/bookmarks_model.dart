import 'dart:convert';

List<BookmarkReqModel> bookmarkReqModelFromJson(String str) =>
    List<BookmarkReqModel>.from(
        json.decode(str).map((x) => BookmarkReqModel.fromJson(x)));

String bookmarkReqModelToJson(List<BookmarkReqModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BookmarkReqModel {
  BookmarkReqModel({
    required this.job,
  });

  final String job;

  factory BookmarkReqModel.fromJson(Map<String, dynamic> json) =>
      BookmarkReqModel(
        job: json["job"],
      );

  Map<String, dynamic> toJson() => {
        "job": job,
      };
}
