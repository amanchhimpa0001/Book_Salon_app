import 'package:book_salon_app/Authentication/login.dart';
import 'package:book_salon_app/controlers/authcontrolers.dart';
import 'package:book_salon_app/helpers/app_services.dart';
import 'package:book_salon_app/main.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<AuthController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homepage"),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                prefs!.remove("user");
                Appservices.pushandremoveuntil(context, login_screen());
              },
              child: Text("Logout")),
          Text(controller.currentUser.SurName),
          Text(controller.currentUser.gender),
          Text(controller.currentUser.username),
          Text(controller.currentUser.email),
          Text(controller.currentUser.dob),
        ],
      ),
    );
  }
}
