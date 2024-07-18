import 'package:book_salon_app/componants/customelevatedbutton.dart';
import 'package:book_salon_app/helpers/app_services.dart';
import 'package:book_salon_app/helpers/color_sheet.dart';
import 'package:book_salon_app/helpers/text_theme.dart';
import 'package:flutter/material.dart';

class Edit_Profile extends StatefulWidget {
  const Edit_Profile({super.key});

  @override
  State<Edit_Profile> createState() => _Edit_ProfileState();
}

class _Edit_ProfileState extends State<Edit_Profile> {
  List<String> usernamelist = ["Male", "Female"];
  var dropdownvalueusername;
  bool isactivename = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightgrey,
        title: Text(
          " Edit Profile",
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
        padding: const EdgeInsets.only(left: 15, right: 20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Appservices.addheight(20),
              Text(
                "Daniel Austin",
                style: GetTextTheme.fs12_medium.copyWith(color: AppColors.grey),
              ),
              Appservices.addheight(40),
              Text(
                "Daniel",
                style: GetTextTheme.fs12_medium.copyWith(color: AppColors.grey),
              ),
              Appservices.addheight(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "12/27/1995",
                    style: GetTextTheme.fs12_medium
                        .copyWith(color: AppColors.grey),
                  ),
                  Text("10:00 AM", style: GetTextTheme.fs12_medium),
                ],
              ),
              Appservices.addheight(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "daniel_austin@yourdomain.com",
                    style: GetTextTheme.fs12_medium
                        .copyWith(color: AppColors.grey),
                  ),
                  Text("10:00 AM", style: GetTextTheme.fs12_medium),
                ],
              ),
              Appservices.addheight(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "United States",
                    style: GetTextTheme.fs12_medium
                        .copyWith(color: AppColors.grey),
                  ),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_drop_down))
                ],
              ),
              Appservices.addheight(40),
              InkWell(
                onTap: () => setState(() {
                  isactivename = !isactivename;
                }),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      dropdownvalueusername ?? "select Gander",
                      style: GetTextTheme.fs12_medium
                          .copyWith(color: AppColors.grey),
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
              ),
              Visibility(
                  visible: isactivename,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ...List.generate(
                            usernamelist.length,
                            (index) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          dropdownvalueusername =
                                              usernamelist[index];
                                          isactivename = false;
                                        });
                                      },
                                      child: Text(
                                        usernamelist[index],
                                        style: GetTextTheme.fs12_regular,
                                      ),
                                    ),
                                  ],
                                )),
                      ],
                    ),
                  )),
              Appservices.addheight(30),
              Text(
                "365 New Avenue, New York, United States",
                style: GetTextTheme.fs12_medium.copyWith(color: AppColors.grey),
              ),
              Appservices.addheight(30),
              CustomElevatedButton(
                  foreground_clr: AppColors.whiteColor,
                  color: AppColors.yellow,
                  btnName: "Update",
                  onTap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
