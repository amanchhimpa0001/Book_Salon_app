// ignore_for_file: must_be_immutable

import 'package:book_salon_app/Home_screen/home_screen.dart';
import 'package:book_salon_app/componants/customelevatedbutton.dart';
import 'package:book_salon_app/componants/text_form_filled.dart';
import 'package:book_salon_app/controlers/authcontrolers.dart';
import 'package:book_salon_app/helpers/app_services.dart';
import 'package:book_salon_app/helpers/color_sheet.dart';
import 'package:book_salon_app/helpers/image.dart';
import 'package:book_salon_app/helpers/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class Fill_your_profile extends StatefulWidget {
  String email, password;

  Fill_your_profile({super.key, required this.email, required this.password});

  @override
  State<Fill_your_profile> createState() => _Fill_your_profileState();
}

class _Fill_your_profileState extends State<Fill_your_profile> {
  var isChecked = true;
  // ignore: unused_field
  var _passwordVisible = false;

  final TextEditingController _DateofBirthController = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _gendercontroller = TextEditingController();
  TextEditingController _usernamecontroller = TextEditingController();
  TextEditingController _namecontroller = TextEditingController();

  @override
  void initState() {
    _emailcontroller.text = widget.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<AuthController>(context, listen: false);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.tranceparent,
        title: Text(
          "Fill Your Profile",
          style:
              GetTextTheme.fs20_regular.copyWith(color: AppColors.blackColor),
        ),
        leading: IconButton(
            onPressed: () {
              Appservices.goback(context);
            },
            icon: Icon(
              Icons.arrow_back_outlined,
              color: AppColors.blackColor,
            )),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Appservices.addheight(20),
                Center(
                  child: Image.asset(Getimage.fillprofileimg),
                ),
                Appservices.addheight(40),
                Customtextformfilled(
                  fillcolor: AppColors.whiteColor,
                  hintText: "Name",
                  controller: _namecontroller,
                ),
                Appservices.addheight(10),
                Customtextformfilled(
                  fillcolor: const Color.fromRGBO(255, 255, 255, 1),
                  hintText: "Surname",
                  controller: _usernamecontroller,
                ),
                Appservices.addheight(10),
                Customtextformfilled(
                  fillcolor: AppColors.whiteColor,
                  hintText: "DateofBirth",
                  controller: _DateofBirthController,
                ),
                Appservices.addheight(10),
                Customtextformfilled(
                  fillcolor: AppColors.whiteColor,
                  hintText: "Email",
                  icon: Icons.email,
                  controller: _emailcontroller,
                ),
                Appservices.addheight(10),
                Customtextformfilled(
                  icon: Icons.swap_vert,
                  fillcolor: AppColors.whiteColor,
                  hintText: "Gander",
                  controller: _gendercontroller,
                ),
                Appservices.addheight(40.h),
                CustomElevatedButton(
                    style: GetTextTheme.fs20_regular,
                    foreground_clr: AppColors.whiteColor,
                    color: AppColors.yellow,
                    btnName: "Continue",
                    onTap: () {
                      controller.signup(
                          _emailcontroller.text,
                          widget.password,
                          _namecontroller.text,
                          _gendercontroller.text,
                          _usernamecontroller.text,
                          _DateofBirthController.text,
                          controller.currentUser.profileimg,
                          context);
                      Appservices.pushto(context, HomeView());
                      // Appservices.pushto(context, ());
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
