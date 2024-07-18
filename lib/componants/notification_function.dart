import 'package:book_salon_app/helpers/app_services.dart';
import 'package:book_salon_app/helpers/color_sheet.dart';
import 'package:book_salon_app/helpers/text_theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Notification_function extends StatelessWidget {
  String image, title, subtitle;
  Notification_function(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          image,
        ),
        Appservices.addWidth(15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GetTextTheme.fs12_medium,
            ),
            Text(
              subtitle,
              style: GetTextTheme.fs10_medium.copyWith(color: AppColors.grey),
            ),
          ],
        )
      ],
    );
  }
}
