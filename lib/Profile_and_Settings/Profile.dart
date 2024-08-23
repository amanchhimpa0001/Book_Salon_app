import 'package:book_salon_app/Authentication/login.dart';
import 'package:book_salon_app/Profile_and_Settings/Edit_Profile.dart';
import 'package:book_salon_app/Profile_and_Settings/Language_Setting.dart';
import 'package:book_salon_app/Profile_and_Settings/Notification_setting.dart';
import 'package:book_salon_app/Profile_and_Settings/PrivacyPolicy.dart';
import 'package:book_salon_app/Profile_and_Settings/Security_Setting.dart';
import 'package:book_salon_app/Profile_and_Settings/invite_friend.dart';
import 'package:book_salon_app/componants/listtile_fuction.dart';
import 'package:book_salon_app/controlers/authcontrolers.dart';
import 'package:book_salon_app/helpers/app_services.dart';
import 'package:book_salon_app/helpers/color_sheet.dart';
import 'package:book_salon_app/helpers/text_theme.dart';
import 'package:book_salon_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class profile_screen extends StatelessWidget {
  const profile_screen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<AuthController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightgrey,
        title: Text(
          "Profile",
          style:
              GetTextTheme.fs18_regular.copyWith(color: AppColors.blackColor),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Appservices.addheight(30.h),
            Image.asset(controller.currentUser.profileimg),
            Appservices.addheight(10.h),
            Text(
              controller.currentUser.SurName,
              style: GetTextTheme.fs18_bold,
            ),
            Text(
              controller.currentUser.email,
              style:
                  GetTextTheme.fs12_medium.copyWith(color: AppColors.greyColor),
            ),
            Appservices.addheight(20.h),
            Listtile_(
              txt: "Edit Profile",
              icon: Icons.person,
              onPressed: () {
                Appservices.pushto(context, Edit_Profile());
              },
            ),
            Appservices.addheight(6.h),
            Listtile_(
              txt: "Notification",
              icon: Icons.notifications,
              onPressed: () {
                Appservices.pushto(context, Notification_setting());
              },
            ),
            Appservices.addheight(6.h),
            Listtile_(
              txt: "Payment",
              icon: Icons.payment,
              onPressed: () {},
            ),
            Appservices.addheight(6.h),
            Listtile_(
              txt: "Security",
              icon: Icons.security,
              onPressed: () {
                Appservices.pushto(context, Security_Setting());
              },
            ),
            Appservices.addheight(6.h),
            Listtile_(
              txt: "Language",
              icon: Icons.language,
              onPressed: () {
                Appservices.pushto(context, Language_Setting());
              },
            ),
            Appservices.addheight(6.h),
            Listtile_(
              txt: "Dark mode",
              icon: Icons.dark_mode,
              onPressed: () {},
            ),
            Listtile_(
              txt: "Privacy Policy",
              icon: Icons.lock,
              onPressed: () {
                Appservices.pushto(context, PrivecyPolicy());
              },
            ),
            Listtile_(
              txt: "Invite Friends",
              icon: Icons.person_add,
              onPressed: () {
                // Appservices.pushto(context, invite_friend());
              },
            ),
            Listtile_(
              txt: "Log out",
              icon: Icons.login,
              onPressed: () {
                prefs!.remove("user");
                Appservices.pushandremoveuntil(context, login_screen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
