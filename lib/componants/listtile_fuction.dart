import 'package:book_salon_app/helpers/color_sheet.dart';
import 'package:book_salon_app/helpers/text_theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Listtile_ extends StatelessWidget {
  String txt;
  Function onPressed;
  IconData icon;

  Listtile_(
      {super.key,
      required this.txt,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        horizontalTitleGap: 2,
        visualDensity: VisualDensity(horizontal: 4),
        onTap: () => onPressed(),
        leading: Icon(
          (icon),
          color: AppColors.darkgrey,
        ),
        title: Text(
          txt,
          style:
              GetTextTheme.fs16_regular.copyWith(color: AppColors.blackColor),
        ),
        trailing: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 10,
            )));
  }
}
