import 'package:book_salon_app/componants/customelevatedbutton.dart';
import 'package:book_salon_app/helpers/app_services.dart';
import 'package:book_salon_app/helpers/color_sheet.dart';
import 'package:book_salon_app/helpers/text_theme.dart';
import 'package:flutter/material.dart';

class Security_Setting extends StatefulWidget {
  const Security_Setting({super.key});

  @override
  State<Security_Setting> createState() => _Security_SettingState();
}

class _Security_SettingState extends State<Security_Setting> {
  List<Notificationsetting> notificationslist = [
    Notificationsetting("Remember me", false),
    Notificationsetting("Face ID", false),
    Notificationsetting("Biometric ID", false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightgrey,
        title: Text(
          "Security Setting",
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
                  height: 10,
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
              Padding(
                padding: const EdgeInsets.only(left: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "General Notification",
                      style: GetTextTheme.fs16_regular,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.keyboard_arrow_right_outlined))
                  ],
                ),
              ),
              Appservices.addheight(20),
              CustomElevatedButton(
                  foreground_clr: AppColors.yellow,
                  color: AppColors.lightyellow,
                  btnName: "Change Password",
                  onTap: () {})
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
