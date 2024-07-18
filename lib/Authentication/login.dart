
import 'package:book_salon_app/Authentication/forget_password.dart';
import 'package:book_salon_app/Authentication/sign_up.dart';
import 'package:book_salon_app/Utils/Utils.dart';
import 'package:book_salon_app/componants/customelevatedbutton.dart';
import 'package:book_salon_app/controlers/authcontrolers.dart';

import 'package:book_salon_app/helpers/app_services.dart';
import 'package:book_salon_app/helpers/image.dart';
import 'package:book_salon_app/helpers/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../helpers/color_sheet.dart';

class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  ValueNotifier<dynamic> _obsecurePassword = ValueNotifier<bool>(false);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();

  FocusNode passwordFocusNode = FocusNode();

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<AuthController>(context, listen: false);

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: AppColors.tranceparent,
          leading: IconButton(
              onPressed: () {
                Appservices.goback(context);
              },
              icon: Icon(
                Icons.arrow_back_sharp,
                color: AppColors.blackColor,
              )),
          elevation: 0,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login to your\nAccount",
                    style: GetTextTheme.fs30_medium,
                  ),
                  Appservices.addheight(60),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    focusNode: emailFocusNode,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: AppColors.blackColor)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: AppColors.blackColor)),
                        hintText: "Email",
                        labelText: "Email",
                        prefixIcon: Icon(
                          Icons.email,
                          color: AppColors.grey,
                        )),
                    onFieldSubmitted: (value) {
                      Utils.fieldFocusChange(
                          context, emailFocusNode, passwordFocusNode);
                    },
                  ),
                  Appservices.addheight(10),
                  ValueListenableBuilder(
                    valueListenable: _obsecurePassword,
                    builder: (context, value, child) {
                      return TextFormField(
                        focusNode: passwordFocusNode,
                        controller: _passwordController,
                        obscureText: _obsecurePassword.value,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: AppColors.blackColor)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: AppColors.blackColor)),
                          hintText: "Password",
                          labelText: "password",
                          prefixIcon: Icon(
                            Icons.lock_open_outlined,
                            color: AppColors.grey,
                          ),
                          suffixIcon: InkWell(
                            onTap: () {},
                            child: Icon(
                              _obsecurePassword.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility,
                              color: AppColors.grey,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Appservices.addheight(20),
                  CheckboxListTile.adaptive(
                    fillColor: MaterialStateProperty.all(AppColors.yellow),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    visualDensity: VisualDensity(horizontal: -4),
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(
                      "Remember me ",
                      style: GetTextTheme.fs12_medium
                          .copyWith(color: AppColors.grey100),
                    ),
                    value: isChecked,
                    onChanged: (value) => setState(() {
                      isChecked = value!;
                    }),
                  ),
                  Appservices.addheight(20.h),
                  CustomElevatedButton(
                      style: GetTextTheme.fs16_regular,
                      foreground_clr: AppColors.whiteColor,
                      color: AppColors.yellow,
                      btnName: "Sign in",
                      onTap: () {
                        controller.signin(_emailController.text,
                            _passwordController.text, context);
                      }),
                  Appservices.addheight(20.h),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Appservices.pushto(context, forgetpassword());
                      },
                      child: Text("Forgotten password",
                          style: GetTextTheme.fs10_regular
                              .copyWith(color: AppColors.darkred)),
                    ),
                  ),
                  Appservices.addheight(60.h),
                  Center(
                    child: Text(
                      "Or Continue with",
                      style: GetTextTheme.fs10_regular,
                    ),
                  ),
                  Appservices.addheight(10.h),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.grey)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(Getimage.goggleimg),
                        Appservices.addWidth(50.h),
                        Image.asset(Getimage.appleimg),
                        Appservices.addWidth(50.h),
                        Image.asset(Getimage.facebookimg),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "don’t have an account ?",
                        style: GetTextTheme.fs10_regular
                            .copyWith(color: AppColors.greyscale),
                      ),
                      TextButton(
                          onPressed: () {
                            Appservices.pushto(context, sign_up_screen());
                          },
                          child: Text("Sign up",
                              style: GetTextTheme.fs10_regular
                                  .copyWith(color: AppColors.darkred)))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
