import 'package:book_salon_app/helpers/app_services.dart';
import 'package:book_salon_app/helpers/color_sheet.dart';
import 'package:book_salon_app/helpers/image.dart';
import 'package:book_salon_app/helpers/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class accountcompletedailog extends StatelessWidget {
  const accountcompletedailog({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 40),
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Appservices.addheight(10),
            Image.asset(
              Getimage.congratulationimg,
              scale: 1,
            ),
            Appservices.addheight(20),
            Text(
              "Congratulations",
              style: GetTextTheme.fs20_bold.copyWith(color: AppColors.yellow),
            ),
            Appservices.addheight(30),
            Text(
              "Select which contact detail should we use to reset your password",
              style: GetTextTheme.fs12_regular.copyWith(color: AppColors.grey),
              textAlign: TextAlign.center,
            ),
            Appservices.addheight(30),
            SpinKitCircle(
              color: AppColors.yellow,
            )
          ],
        ),
      ],
    );
  }
}
