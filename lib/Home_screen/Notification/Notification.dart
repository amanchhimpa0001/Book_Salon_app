import 'package:book_salon_app/componants/notification_function.dart';
import 'package:book_salon_app/helpers/app_services.dart';
import 'package:book_salon_app/helpers/color_sheet.dart';
import 'package:book_salon_app/helpers/image.dart';
import 'package:book_salon_app/helpers/text_theme.dart';
import 'package:flutter/material.dart';

class Notification_screen extends StatelessWidget {
  const Notification_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.tranceparent,
        title: Text(
          "Notification",
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
        actions: [Icon(Icons.pending_outlined), Appservices.addWidth(10)],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 10),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Appservices.addheight(20),
              Text(
                "Today",
                style: GetTextTheme.fs16_medium,
              ),
              Appservices.addheight(20),
              Notification_function(
                  image: Getimage.haircutimg,
                  title: "Payment Successfull",
                  subtitle: "You have made a solon Payment"),
              Appservices.addheight(20),
              Text(
                "Yesterday",
                style: GetTextTheme.fs16_medium,
              ),
              Appservices.addheight(20),
              Notification_function(
                  image: Getimage.massageimg,
                  title: "New Services Available!",
                  subtitle: "Now you can search the nearest salon"),
              Appservices.addheight(20),
              Notification_function(
                  image: Getimage.haircutimg,
                  title: "Today sepecial offers",
                  subtitle: "You have made a solon Payment"),
              Appservices.addheight(20),
              Text(
                "December 11. 2024",
                style: GetTextTheme.fs16_medium,
              ),
              Appservices.addheight(20),
              Notification_function(
                  image: Getimage.massageimg,
                  title: "Credit Card Connected",
                  subtitle: "Now you can search the nearest salon"),
              Appservices.addheight(20),
              Notification_function(
                  image: Getimage.haircutimg,
                  title: "Account setup sucessful!",
                  subtitle: "You have made a solon Payment"),
            ],
          ),
        ),
      ),
    );
  }
}
