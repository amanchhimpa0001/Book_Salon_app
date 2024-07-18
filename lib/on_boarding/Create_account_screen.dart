import 'package:book_salon_app/Authentication/login.dart';
import 'package:book_salon_app/Authentication/sign_up.dart';
import 'package:book_salon_app/componants/customelevatedbutton.dart';
import 'package:book_salon_app/componants/text_button.dart';
import 'package:book_salon_app/helpers/app_services.dart';
import 'package:book_salon_app/helpers/color_sheet.dart';
import 'package:book_salon_app/helpers/image.dart';
import 'package:book_salon_app/helpers/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Create_account extends StatelessWidget {
  const Create_account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.tranceparent,
        leading: IconButton(
            onPressed: () {
              Appservices.goback(context);
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              color: AppColors.blackColor,
            )),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Appservices.addheight(250),
                Text(
                  "Let’s you in",
                  style: GetTextTheme.fs30_medium,
                ),
                Appservices.addheight(20.h),
                Textbutton(
                  isCenter: true,
                  style: GetTextTheme.fs16_regular
                      .copyWith(color: AppColors.blackColor),
                  vertical: 15,
                  backgroundColor: AppColors.whiteColor,
                  ontap: () {},
                  image: Getimage.goggleimg,
                  text: "Continue with Google",
                ),
                Textbutton(
                  isCenter: true,
                  style: GetTextTheme.fs16_regular
                      .copyWith(color: AppColors.blackColor),
                  vertical: 15,
                  backgroundColor: AppColors.whiteColor,
                  ontap: () {},
                  image: Getimage.facebookimg,
                  text: "Continue with Facebook",
                ),
                Textbutton(
                  isCenter: true,
                  style: GetTextTheme.fs16_regular
                      .copyWith(color: AppColors.blackColor),
                  vertical: 15,
                  backgroundColor: AppColors.whiteColor,
                  ontap: () {},
                  image: Getimage.appleimg,
                  text: "Continue with Apple",
                ),
                Appservices.addheight(30.h),
                Text(
                  "Or",
                  style: GetTextTheme.fs16_regular,
                ),
                Appservices.addheight(30.h),
                CustomElevatedButton(
                    style: GetTextTheme.fs16_regular,
                    foreground_clr: AppColors.whiteColor,
                    color: AppColors.yellow,
                    btnName: "Sign in with password",
                    onTap: () {
                      Appservices.pushto(context, login_screen());
                    }),
                Appservices.addheight(20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "don’t have an account ?",
                      style: GetTextTheme.fs12_regular
                          .copyWith(color: AppColors.grey),
                    ),
                    TextButton(
                        onPressed: () {
                          Appservices.pushto(context, sign_up_screen());
                        },
                        child: Text("Sign up",
                            style: GetTextTheme.fs12_regular
                                .copyWith(color: AppColors.darkred)))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
