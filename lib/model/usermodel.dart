import 'dart:convert';

class UserModel {
  String SurName;
  String email;
  String password;
  String gender;
  String username;
  String dob;
  String profileimg;
  UserModel(
      {required this.SurName,
      required this.email,
      required this.password,
      required this.gender,
      required this.username,
      required this.dob,
      required this.profileimg});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'SurName': SurName});
    result.addAll({'email': email});
    result.addAll({'password': password});
    result.addAll({'gender': gender});
    result.addAll({'Username': username});
    result.addAll({'Dateofbirth': username});
    result.addAll({'profileimg': profileimg});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      SurName: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      gender: map['gender'] ?? '',
      username: map['username'] ?? '',
      dob: map['dob'] ?? '',
      profileimg: map['profileimg'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
