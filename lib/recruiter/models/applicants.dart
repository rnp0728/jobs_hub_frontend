import 'dart:convert';

List<ApplicantsResponseModel> applicantsResponseModelFromJson(String str) =>
    List<ApplicantsResponseModel>.from(
        json.decode(str).map((x) => ApplicantsResponseModel.fromJson(x)));

String applicantsResponseModelToJson(List<ApplicantsResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApplicantsResponseModel {
  final String id;
  final Internship? internship;
  final User user;
  final String agentId;
  final Job? job;

  ApplicantsResponseModel({
    required this.id,
    required this.internship,
    required this.user,
    required this.agentId,
    required this.job,
  });

  factory ApplicantsResponseModel.fromJson(Map<String, dynamic> json) =>
      ApplicantsResponseModel(
        id: json["_id"],
        internship: json["internship"] != null
            ? Internship.fromJson(json["internship"])
            : null,
        user: User.fromJson(json["user"]),
        agentId: json["agentId"],
        job: json["job"] != null ? Job.fromJson(json["job"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "internship": internship?.toJson(),
        "user": user.toJson(),
        "agentId": agentId,
        "job": job?.toJson(),
      };
}

class Job {
  final List<dynamic> skillsRequired;
  final String id;
  final String title;
  final String location;
  final String company;
  final String description;
  final bool hiring;
  final String period;
  final String contract;
  final List<String> requirements;
  final String imageUrl;
  final String agentId;
  final String salary;

  Job({
    required this.skillsRequired,
    required this.id,
    required this.title,
    required this.location,
    required this.company,
    required this.description,
    required this.hiring,
    required this.period,
    required this.contract,
    required this.requirements,
    required this.imageUrl,
    required this.agentId,
    required this.salary,
  });

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        skillsRequired:
            List<dynamic>.from(json["skillsRequired"].map((x) => x)),
        id: json["_id"],
        title: json["title"],
        location: json["location"],
        company: json["company"],
        description: json["description"],
        hiring: json["hiring"],
        period: json["period"],
        contract: json["contract"],
        requirements: List<String>.from(json["requirements"].map((x) => x)),
        imageUrl: json["imageUrl"],
        agentId: json["agentId"],
        salary: json["salary"],
      );

  Map<String, dynamic> toJson() => {
        "skillsRequired": List<dynamic>.from(skillsRequired.map((x) => x)),
        "_id": id,
        "title": title,
        "location": location,
        "company": company,
        "description": description,
        "hiring": hiring,
        "period": period,
        "contract": contract,
        "requirements": List<dynamic>.from(requirements.map((x) => x)),
        "imageUrl": imageUrl,
        "agentId": agentId,
        "salary": salary,
      };
}

class Internship {
  final List<dynamic> skillsRequired;
  final String id;
  final String title;
  final String location;
  final String company;
  final String description;
  final String stipend;
  final String duration;
  final bool hiring;
  final String period;
  final String contract;
  final List<String> requirements;
  final String imageUrl;
  final String agentId;

  Internship({
    required this.skillsRequired,
    required this.id,
    required this.title,
    required this.location,
    required this.company,
    required this.description,
    required this.stipend,
    required this.duration,
    required this.hiring,
    required this.period,
    required this.contract,
    required this.requirements,
    required this.imageUrl,
    required this.agentId,
  });

  factory Internship.fromJson(Map<String, dynamic> json) => Internship(
        skillsRequired:
            List<dynamic>.from(json["skillsRequired"].map((x) => x)),
        id: json["_id"],
        title: json["title"],
        location: json["location"],
        company: json["company"],
        description: json["description"],
        stipend: json["stipend"],
        duration: json["duration"],
        hiring: json["hiring"],
        period: json["period"],
        contract: json["contract"],
        requirements: List<String>.from(json["requirements"].map((x) => x)),
        imageUrl: json["imageUrl"],
        agentId: json["agentId"],
      );

  Map<String, dynamic> toJson() => {
        "skillsRequired": List<dynamic>.from(skillsRequired.map((x) => x)),
        "_id": id,
        "title": title,
        "location": location,
        "company": company,
        "description": description,
        "stipend": stipend,
        "duration": duration,
        "hiring": hiring,
        "period": period,
        "contract": contract,
        "requirements": List<dynamic>.from(requirements.map((x) => x)),
        "imageUrl": imageUrl,
        "agentId": agentId,
      };
}

class User {
  final String id;
  final String username;
  final String email;
  final String password;
  final bool isAdmin;
  final bool isAgent;
  final List<String> skills;
  final String profile;
  final String location;
  final String phone;
  final String userType;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.isAdmin,
    required this.isAgent,
    required this.skills,
    required this.profile,
    required this.location,
    required this.phone,
    required this.userType,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        isAdmin: json["isAdmin"],
        isAgent: json["isAgent"],
        skills: List<String>.from(json["skills"].map((x) => x)),
        profile: json["profile"],
        location: json["location"],
        phone: json["phone"],
        userType: json["userType"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
        "password": password,
        "isAdmin": isAdmin,
        "isAgent": isAgent,
        "skills": List<dynamic>.from(skills.map((x) => x)),
        "profile": profile,
        "location": location,
        "phone": phone,
        "userType": userType,
      };
}
