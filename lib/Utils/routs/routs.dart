import 'package:book_salon_app/Authentication/Create_new_password.dart';
import 'package:book_salon_app/Authentication/fill_your_profile.dart';
import 'package:book_salon_app/Authentication/login.dart';
import 'package:book_salon_app/Authentication/otp_screen.dart';
import 'package:book_salon_app/Authentication/sign_up.dart';
import 'package:book_salon_app/Profile_and_Settings/Language_Setting.dart';
import 'package:book_salon_app/Profile_and_Settings/Notification_setting.dart';

import 'package:book_salon_app/Profile_and_Settings/Profile.dart';
import 'package:book_salon_app/Utils/routs/routs_name.dart';
import 'package:book_salon_app/on_boarding/Create_account_screen.dart';
import 'package:book_salon_app/on_boarding/slider_screen.dart';
import 'package:book_salon_app/on_boarding/splash_scrren.dart';
import 'package:flutter/material.dart';

class Routes {
  static MaterialPageRoute zgenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routesname.splash_screen:
        return MaterialPageRoute(builder: (context) => Splash_screen());
      case Routesname.slider_screen:
        return MaterialPageRoute(builder: (context) => slider_screen());
      case Routesname.Create_account:
        return MaterialPageRoute(builder: (context) => Create_account());
      case Routesname.login_screen:
        return MaterialPageRoute(builder: (context) => login_screen());
      case Routesname.sign_up_screen:
        return MaterialPageRoute(builder: (context) => sign_up_screen());
      case Routesname.fill_your_profile:
        return MaterialPageRoute(
            builder: (context) => Fill_your_profile(
                  email: "",
                  password: "",
                ));
      case Routesname.otp_screen:
        return MaterialPageRoute(builder: (context) => otp_screen());
      case Routesname.Createnewpassword:
        return MaterialPageRoute(builder: (context) => Createnewpassword());
      case Routesname.profile_screen:
        return MaterialPageRoute(builder: (context) => profile_screen());
      case Routesname.Notification_setting:
        return MaterialPageRoute(builder: (context) => Notification_setting());
      case Routesname.Language_Setting:
        return MaterialPageRoute(builder: (context) => Language_Setting());
      // case Routesname.privecyPolicy:
      //   return MaterialPageRoute(builder: (context) => PrivecyPolicy());

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Column(
              children: [Text("no route difined")],
            ),
          ),
        );
    }
  }
}
