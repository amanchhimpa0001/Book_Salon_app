import 'package:book_salon_app/helpers/app_services.dart';
import 'package:book_salon_app/helpers/color_sheet.dart';
import 'package:book_salon_app/helpers/text_theme.dart';

import 'package:flutter/material.dart';

class Notification_setting extends StatefulWidget {
  const Notification_setting({super.key});

  @override
  State<Notification_setting> createState() => _Notification_settingState();
}

class _Notification_settingState extends State<Notification_setting> {
  List<Notificationsetting> notificationslist = [
    Notificationsetting("General Notification", false),
    Notificationsetting("Sound", false),
    Notificationsetting("Special offers", false),
    Notificationsetting("Promo & Discount", false),
    Notificationsetting("Payments", false),
    Notificationsetting("Cashback", false),
    Notificationsetting("App Updates", false),
    Notificationsetting("New Services Available", false),
    Notificationsetting("New Tips Available", false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightgrey,
        title: Text(
          "Notification setting",
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 16,
                ),
                shrinkWrap: true,
                itemCount: notificationslist.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      notificationslist[index].title,
                      style: GetTextTheme.fs16_regular,
                    ),
                    trailing: Switch(
                        activeColor: AppColors.yellow,
                        value: notificationslist[index].iseneble,
                        onChanged: (value) {
                          setState(() {
                            notificationslist[index].iseneble =
                                !notificationslist[index].iseneble;
                          });
                        }),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Notificationsetting {
  String title;
  bool iseneble;
  Notificationsetting(this.title, this.iseneble);
}
