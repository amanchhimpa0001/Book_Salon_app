import 'package:book_salon_app/helpers/app_services.dart';
import 'package:book_salon_app/helpers/color_sheet.dart';
import 'package:book_salon_app/helpers/text_theme.dart';
import 'package:flutter/material.dart';

class PrivecyPolicy extends StatefulWidget {
  const PrivecyPolicy({super.key});

  @override
  State<PrivecyPolicy> createState() => _PrivecyPolicyState();
}

class _PrivecyPolicyState extends State<PrivecyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightgrey,
        title: Text(
          "Privacy policy",
          style:
              GetTextTheme.fs18_regular.copyWith(color: AppColors.blackColor),
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
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Appservices.addheight(10),
                Container(
                  width: Appservices.getScreenWidth(context),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(color: AppColors.lightgrey),
                  child: Text(
                    "1. Types of data We Collect",
                    style: GetTextTheme.fs18_regular
                        .copyWith(color: AppColors.blackColor),
                  ),
                ),
                Appservices.addheight(10),
                Text(
                  "Lorem ipsum dolor sit amet consectetur. Nam ipsum nibh vitae turpis. Mi enim amet sit porttitor. Lectus sed eget non eget nibh cursus odio pretium sagittis. Adipiscing sed ut vulputate duis euismod sed lacus proin et.",
                  style:
                      GetTextTheme.fs18_regular.copyWith(color: AppColors.grey),
                ),
                Appservices.addheight(10),
                Container(
                  width: Appservices.getScreenWidth(context),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(color: AppColors.lightgrey),
                  child: Text(
                    "2. Use Of Personal Data",
                    style: GetTextTheme.fs18_regular
                        .copyWith(color: AppColors.blackColor),
                  ),
                ),
                Appservices.addheight(10),
                Text(
                  "Lorem ipsum dolor sit amet consectetur. Nam ipsum nibh vitae turpis. Mi enim amet sit porttitor. Lectus sed eget non eget nibh cursus odio pretium sagittis. Adipiscing sed ut vulputate duis euismod sed lacus proin et.",
                  style:
                      GetTextTheme.fs18_regular.copyWith(color: AppColors.grey),
                ),
                Appservices.addheight(10),
                Container(
                  width: Appservices.getScreenWidth(context),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(color: AppColors.lightgrey),
                  child: Text(
                    "3. Disclosure of Your Personal Data",
                    style: GetTextTheme.fs18_regular
                        .copyWith(color: AppColors.blackColor),
                  ),
                ),
                Appservices.addheight(10),
                Text(
                  "Lorem ipsum dolor sit amet consectetur. Malesuada sed tincidunt mauris adipiscing diam viverra eleifend risus pharetra. Ut posuere donec feugiat lorem senectus egestas quam proin nunc. Mauris arcu nibh diam viverra. Eu mauris eget ultricies amet pellentesque consequat fermentum sed turpis. Quam id amet blandit id molestie ac dui. Massa arcu quis magnis elit nullam morbi viverra.",
                  style:
                      GetTextTheme.fs18_regular.copyWith(color: AppColors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
