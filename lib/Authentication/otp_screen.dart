import 'package:book_salon_app/Authentication/Create_new_password.dart';
import 'package:book_salon_app/helpers/app_services.dart';
import 'package:book_salon_app/helpers/color_sheet.dart';
import 'package:book_salon_app/helpers/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class otp_screen extends StatelessWidget {
  const otp_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.tranceparent,
        title: Text(
          "Forget Password",
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Code has been send to +1 111******99",
                  style: GetTextTheme.fs12_regular
                      .copyWith(color: AppColors.greyscale),
                ),
              ),
              Appservices.addheight(20),
              PinCodeTextField(
                appContext: context,
                length: 4,
                textStyle: GetTextTheme.fs16_regular
                    .copyWith(color: AppColors.blackColor),
                autoFocus: true,
                enableActiveFill: true,
                showCursor: false,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    fieldHeight: 42,
                    fieldWidth: 60,
                    selectedColor: AppColors.yellow,
                    activeColor: AppColors.grey,
                    disabledColor: AppColors.blackColor,
                    inactiveColor: AppColors.grey,
                    selectedFillColor: AppColors.lightyellow,
                    borderRadius: BorderRadius.circular(10),
                    activeFillColor: AppColors.whiteColor,
                    inactiveFillColor: AppColors.whiteColor),
                onChanged: (pin) {
                  print(pin);
                },
                onCompleted: (pin) {
                  Appservices.pushto(context, Createnewpassword());
                },
              ),
              Appservices.addheight(20),
              Center(
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                      text: "Resend code in ",
                      style: GetTextTheme.fs12_regular
                          .copyWith(color: AppColors.greyscale)),
                  TextSpan(
                      text: "56s",
                      style: GetTextTheme.fs12_regular.copyWith(
                        color: AppColors.darkred,
                      ))
                ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
