import 'dart:convert';
import 'dart:io';

import 'package:book_salon_app/Utils/Utils.dart';
import 'package:book_salon_app/backanddata/dummydata.dart';
import 'package:book_salon_app/data/Network/BaseApiServices.dart';
import 'package:book_salon_app/main.dart';
import 'package:book_salon_app/model/usermodel.dart';
import 'package:flutter/services.dart';

class NetworkApis extends BaseUrls {
  @override
  Future<dynamic> authfunction(data, {bool islogin = true}) async {
    try {
      String email = data["email"];
      String password = data["password"];
      if (islogin) {
        bool isuserExist = allUsers.any((element) => element.email == email);
        if (isuserExist) {
          UserModel user =
              allUsers.firstWhere((element) => element.email == email);
          bool isPasswordSame = user.password == password;
          if (isPasswordSame) {
            prefs!.setString("user", user.toJson());
            return user;
          } else {
            throw Utils.toastmassage("Wrong Password");
          }
        } else {
          throw Utils.toastmassage("User not Found");
        }
      } else {
        bool isuserExist = allUsers.any((element) => element.email == email);
        if (isuserExist) {
          throw Utils.toastmassage(
              "Already user exist please use any other email");
        } else {
          String name = data["name"];
          String gender = data["gender"];
          String username = data["username"];
          String dob = data["dob"];
          String profileimg = data["profileimg"];
          UserModel user = UserModel(
              SurName: name,
              email: email,
              password: password,
              gender: gender,
              username: username,
              dob: dob,
              profileimg: profileimg);
          allUsers.add(user);
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future solon_getdata(String json) async {
    var response;
    try {
      final snapshot = await rootBundle.loadString(json);
      response = jsonDecode(snapshot);
    } catch (e) {
      if (e is SocketException) {
        throw "=========================================";
      }
    }
    return response;
  }
}
