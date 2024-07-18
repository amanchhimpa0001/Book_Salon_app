import 'package:book_salon_app/Home_screen/home_screen.dart';
import 'package:book_salon_app/helpers/app_services.dart';
import 'package:book_salon_app/model/usermodel.dart';
import 'package:book_salon_app/on_boarding/bottom_navbar.dart';
import 'package:book_salon_app/respository/auth_repo/auth_repository.dart';
import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  late UserModel currentUser = UserModel(
      SurName: "",
      email: "",
      password: "",
      gender: "",
      username: "",
      dob: "",
      profileimg: "assets/fill_profile.png");

  updatenewaccountUser(UserModel user) {
    currentUser = user;
    notifyListeners();
  }

  AuthRepository Authenticationapis = AuthRepository();

  Future<dynamic> signin(
      String email, String password, BuildContext context) async {
    Map data = {
      "email": email,
      "password": password,
    };
    Authenticationapis.signin(data).then((value) {
      updatenewaccountUser(value);

      Appservices.pushto(context, BottomNavBar());
    }).onError((error, stackTrace) {
      print("=============$error");
    });
  }

  Future<dynamic> signup(
      String email,
      String password,
      String name,
      String gender,
      String username,
      String dob,
      String profileimg,
      BuildContext context) async {
    Map data = {
      "email": email,
      "password": password,
      "name": name,
      "gender": gender,
      "username": username,
      "dob": dob,
      "profileimg": profileimg,
    };
    Authenticationapis.signup(data).then((value) {
      updatenewaccountUser(UserModel(
          SurName: name,
          email: email,
          password: password,
          gender: gender,
          username: username,
          dob: dob,
          profileimg: profileimg));

      Appservices.pushto(context, BottomNavBar());
    }).onError((error, stackTrace) {
      print("====================$error");
    });
  }
}
