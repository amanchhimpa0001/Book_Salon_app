import 'package:book_salon_app/helpers/app_services.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Textbutton extends StatelessWidget {
  String image;
  String text;
  Color backgroundColor;

  double vertical;
  Function? ontap;
  bool isCenter;
  TextStyle? style;

  Textbutton(
      {super.key,
      required this.image,
      required this.text,
      required this.backgroundColor,
      required this.vertical,
      this.ontap,
      this.isCenter = false,
      required this.style});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          padding: MaterialStatePropertyAll(
              EdgeInsets.symmetric(vertical: vertical)),
        ),
        onPressed: () {
          ontap!();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment:
                isCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
            children: [
              Image.asset(image),
              Appservices.addWidth(
                10,
              ),
              Text(
                text,
                style: style,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ));
  }
}
