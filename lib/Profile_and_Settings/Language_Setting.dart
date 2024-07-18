import 'package:book_salon_app/helpers/app_services.dart';
import 'package:book_salon_app/helpers/color_sheet.dart';
import 'package:book_salon_app/helpers/text_theme.dart';
import 'package:flutter/material.dart';

class Language_Setting extends StatefulWidget {
  const Language_Setting({super.key});

  @override
  State<Language_Setting> createState() => _Language_SettingState();
}

class _Language_SettingState extends State<Language_Setting> {
  List<Languagefuction> Suggestedlist = [
    Languagefuction("English (US)", false),
    Languagefuction("English (Uk)", false),
  ];

  List<Languagefuction> Languagelist = [
    Languagefuction("Mandarin", false),
    Languagefuction("Hindi", false),
    Languagefuction("French", false),
    Languagefuction("Arabic", false),
    Languagefuction("Bengali", false),
    Languagefuction("Russian", false),
    Languagefuction("Indonesian", false),
  ];

  String activeLanguage = "";
  String activeLanguage2 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightgrey,
        title: Text(
          "Language",
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
        padding: EdgeInsets.only(left: 10, right: 10),
        child: SafeArea(
          child: Column(
            children: [
              Appservices.addheight(10),
              Container(
                width: Appservices.getScreenWidth(context),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(color: AppColors.lightgrey),
                child: Text(
                  "Suggested",
                  style: GetTextTheme.fs18_regular
                      .copyWith(color: AppColors.blackColor),
                ),
              ),
              ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 1,
                ),
                shrinkWrap: true,
                itemCount: Suggestedlist.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () => setState(() =>
                        activeLanguage = Suggestedlist[index].languagetittle),
                    title: Text(
                      Suggestedlist[index].languagetittle,
                      style: GetTextTheme.fs16_regular,
                    ),
                    trailing: Radio(
                      fillColor: MaterialStatePropertyAll(AppColors.orange),
                      value: Suggestedlist[index].languagetittle,
                      groupValue: activeLanguage,
                      onChanged: (v) => setState(() {
                        activeLanguage = v!;
                      }),
                    ),
                  );
                },
              ),
              Appservices.addheight(10),
              Container(
                width: Appservices.getScreenWidth(context),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(color: AppColors.lightgrey),
                child: Text(
                  "Language",
                  style: GetTextTheme.fs18_regular
                      .copyWith(color: AppColors.blackColor),
                ),
              ),
              ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 1,
                ),
                shrinkWrap: true,
                itemCount: Languagelist.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    // onTap: () => setState(() =>
                    //     ),
                    title: Text(
                      Languagelist[index].languagetittle,
                      style: GetTextTheme.fs16_regular,
                    ),
                    trailing: Radio(
                      fillColor: MaterialStatePropertyAll(AppColors.orange),
                      value: Languagelist[index].languagetittle,
                      groupValue: activeLanguage,
                      onChanged: (v) => setState(() {
                        activeLanguage = v!;
                      }),
                    ),
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

class Languagefuction {
  String languagetittle;
  bool isslect;
  Languagefuction(this.languagetittle, this.isslect);
}
