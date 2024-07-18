// ignore_for_file: must_be_immutable

import 'package:book_salon_app/helpers/app_services.dart';
import 'package:book_salon_app/helpers/color_sheet.dart';
import 'package:book_salon_app/helpers/text_theme.dart';
import 'package:flutter/material.dart';

class ListTile_solon_fun extends StatelessWidget {
  String image, title, location, distance, rating;
  Function onPressed;

  ListTile_solon_fun(
      {super.key,
      required this.image,
      required this.title,
      required this.onPressed,
      required this.location,
      required this.distance,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(image),
              Appservices.addheight(10),
              Appservices.addWidth(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GetTextTheme.fs16_medium,
                  ),
                  Appservices.addheight(10),
                  Text(location, style: TextStyle(color: AppColors.grey)),
                  Appservices.addheight(2),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        size: 15,
                        color: AppColors.orange,
                      ),
                      Appservices.addWidth(3),
                      Text(distance, style: TextStyle(color: AppColors.grey)),
                      Appservices.addWidth(5),
                      Icon(
                        Icons.star,
                        size: 15,
                        color: AppColors.orange,
                      ),
                      Appservices.addWidth(3),
                      Text(rating, style: TextStyle(color: AppColors.grey))
                    ],
                  )
                ],
              ),
            ],
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.bookmark_border,
                size: 30,
                color: AppColors.orange,
              ))
        ],
      ),
    );
  }
}
