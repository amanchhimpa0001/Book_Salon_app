// ignore_for_file: must_be_immutable

import 'package:book_salon_app/helpers/color_sheet.dart';
import 'package:flutter/material.dart';



class CustomElevatedButton extends StatelessWidget {
  String btnName;
  Function onTap;
  Color? color;
  Color? icon_clr;
  Color foreground_clr;
  TextStyle? style;

  CustomElevatedButton(
      {required this.btnName,
      required this.onTap,
      this.color,
      this.style,
      this.foreground_clr = AppColors.blackColor,
      this.icon_clr,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                    vertical: 10,
                  )),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
                  backgroundColor: MaterialStateProperty.all(
                      color ?? AppColors.primaryColor),
                  foregroundColor: MaterialStateProperty.all(foreground_clr)),
              onPressed: () => onTap(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    btnName,
                    style: style,
                    textAlign: TextAlign.center,
                  )
                ],
              )),
        )
      ],
    );
  }
}
