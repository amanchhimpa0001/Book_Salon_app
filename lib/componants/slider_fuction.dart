// ignore_for_file: must_be_immutable

import 'package:book_salon_app/helpers/app_services.dart';
import 'package:book_salon_app/helpers/text_theme.dart';
import 'package:flutter/material.dart';


class Sliderfunction extends StatelessWidget {
  String salonimage;
  String description;

  Sliderfunction({
    super.key,
    required this.salonimage,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(salonimage),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Appservices.addheight(15),
              Text(
                description,
                style: GetTextTheme.fs24_medium,
                textAlign: TextAlign.center,
              )
            ],
          ),
        )
      ],
    );
  }
}
