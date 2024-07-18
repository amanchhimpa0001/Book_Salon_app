// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'dart:convert';

import 'package:book_salon_app/controlers/app_controllers.dart';
import 'package:book_salon_app/controlers/authcontrolers.dart';
import 'package:book_salon_app/helpers/app_services.dart';
import 'package:book_salon_app/helpers/image.dart';
import 'package:book_salon_app/main.dart';
import 'package:book_salon_app/model/usermodel.dart';
import 'package:book_salon_app/on_boarding/slider_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../backanddata/dummydata.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  void initState() {
    super.initState();
    initalState();
  }

  getAllUsers() async {
    final jsonData = await rootBundle.loadString("assets/jsons/login.json");
    final decodedData = jsonDecode(jsonData) as List;
    allUsers = decodedData.map((e) => UserModel.fromMap(e)).toList();
    print(allUsers);
  }

  initalState() async {
    var provider2 = Provider.of<appController>(context, listen: false);
    provider2.salon_api();
    await getAllUsers();

    var user = prefs!.getString("user") ?? '';
    final provider = Provider.of<AuthController>(context, listen: false);
    if (user.isEmpty) {
      Appservices.pushandremoveuntil(context, slider_screen());
      // Appservices.pushNamed(context, Routesname.login_screen);
    } else {
      provider.updatenewaccountUser(UserModel.fromJson(user));
      Appservices.pushandremoveuntil(context, slider_screen());
      // Appservices.pushNamed(context, Routesname.sign_up_screen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                Getimage.splashimg,
                height: 500,
                alignment: Alignment.center,
              ),
            ),
            Appservices.addheight(10),
            SpinKitCircle(
              color: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }
}
