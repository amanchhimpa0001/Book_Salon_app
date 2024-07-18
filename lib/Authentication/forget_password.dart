import 'package:book_salon_app/Authentication/otp_screen.dart';
import 'package:book_salon_app/componants/customelevatedbutton.dart';
import 'package:book_salon_app/helpers/app_services.dart';
import 'package:book_salon_app/helpers/color_sheet.dart';
import 'package:book_salon_app/helpers/image.dart';
import 'package:book_salon_app/helpers/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class forgetpassword extends StatelessWidget {
  const forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.tranceparent,
        title: Text(
          "Forget Pasword",
          style:
              GetTextTheme.fs16_regular.copyWith(color: AppColors.blackColor),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Appservices.addheight(10),
              Center(
                child: Image.asset(
                  Getimage.lockimg,
                  scale: 1,
                ),
              ),
              Appservices.addheight(83),
              Text(
                "Select which contact detail should we use to reset your password",
                style:
                    GetTextTheme.fs16_regular.copyWith(color: AppColors.grey),
              ),

              Appservices.addheight(16),
              Container(
                padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 15.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.grey),
                    color: AppColors.whiteColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(18.sp),
                      decoration: BoxDecoration(
                          color: AppColors.lightyellow,
                          borderRadius: BorderRadius.circular(6.r)),
                      child: Icon(
                        Icons.sms,
                        color: AppColors.yellow,
                      ),
                    ),
                    Appservices.addWidth(15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          " via SMS::",
                          style: GetTextTheme.fs12_regular
                              .copyWith(color: AppColors.greyColor),
                        ),
                        Text(
                          "+91 637 7327",
                          style: GetTextTheme.fs14_regular
                              .copyWith(color: AppColors.greyscale),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Appservices.addheight(20.h),
              Container(
                padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 12.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.grey),
                    color: AppColors.whiteColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(18.sp),
                      decoration: BoxDecoration(
                          color: AppColors.lightyellow,
                          borderRadius: BorderRadius.circular(6)),
                      child: Icon(
                        Icons.email,
                        color: AppColors.yellow,
                      ),
                    ),
                    Appservices.addWidth(15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "via Email::",
                          style: GetTextTheme.fs12_regular
                              .copyWith(color: AppColors.greyColor),
                        ),
                        Text(
                          "navdeepghanghas002@gmail.com",
                          style: GetTextTheme.fs14_regular
                              .copyWith(color: AppColors.greyscale),
                        ),
                      ],
                    ),
                    Appservices.addWidth(8),
                  ],
                ),
              ),

              // ListTile(
              //   horizontalTitleGap: 20,
              //   contentPadding: EdgeInsets.all(18),
              //   shape: Border.all(color: AppColors.blackColor),
              //   leading: Image.asset("assets/sms.png",
              //       fit: BoxFit.cover, height: 100, cacheHeight: 100),
              //   focusColor: AppColors.blackColor,
              //   subtitle: Text("+91 637 7327"),
              //   title: Text("Via sms"),
              // ),
              // Appservices.addheight(10.h),
              // ListTile(
              //   horizontalTitleGap: 20,
              //   contentPadding: EdgeInsets.all(18),
              //   shape: Border.all(color: AppColors.blackColor),
              //   leading: Image.asset("assets/mail.png",
              //       fit: BoxFit.cover, height: 100, cacheHeight: 100),
              //   focusColor: AppColors.blackColor,
              //   subtitle: Text("navdeepghanghas002@gmail.com"),
              //   title: Text("Via mail"),
              // ),
              Appservices.addheight(40.h),
              CustomElevatedButton(
                  style: GetTextTheme.fs16_regular,
                  foreground_clr: AppColors.whiteColor,
                  color: AppColors.yellow,
                  btnName: "Continue",
                  onTap: () {
                    Appservices.pushto(context, otp_screen());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
