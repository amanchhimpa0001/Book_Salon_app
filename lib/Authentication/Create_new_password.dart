import 'package:book_salon_app/componants/customelevatedbutton.dart';
import 'package:book_salon_app/dailog/newpassworddailog.dart';
import 'package:book_salon_app/helpers/app_services.dart';
import 'package:book_salon_app/helpers/color_sheet.dart';
import 'package:book_salon_app/helpers/image.dart';
import 'package:book_salon_app/helpers/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Createnewpassword extends StatefulWidget {
  const Createnewpassword({super.key});

  @override
  State<Createnewpassword> createState() => _CreatenewpasswordState();
}

class _CreatenewpasswordState extends State<Createnewpassword> {
  ValueNotifier<dynamic> _obsecurePassword = ValueNotifier<bool>(false);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();

  FocusNode passwordFocusNode = FocusNode();

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   NetworkApis apis = NetworkApis();
      //   apis.authBase({});
      // }),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.tranceparent,
        title: Text(
          "Create new password",
          style:
              GetTextTheme.fs20_regular.copyWith(color: AppColors.blackColor),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Appservices.addheight(100),
                Center(
                    child: Container(
                        height: 150,
                        padding: EdgeInsets.all(10),
                        child: Image.asset(Getimage.securitypasswords))),
                Appservices.addheight(80),
                Text(
                  "Create your new password",
                  style: GetTextTheme.fs16_regular,
                ),
                Appservices.addheight(10),
                ValueListenableBuilder(
                  valueListenable: _obsecurePassword,
                  builder: (context, value, child) {
                    return TextFormField(
                      focusNode: emailFocusNode,
                      controller: _emailController,
                      obscureText: _obsecurePassword.value,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: AppColors.blackColor)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: AppColors.blackColor)),
                        hintText: "email",
                        labelText: "email",
                        prefixIcon: Icon(
                          Icons.lock_rounded,
                          color: AppColors.grey,
                        ),
                        suffixIcon: InkWell(
                          onTap: () {
                            _obsecurePassword.value = !_obsecurePassword.value;
                          },
                          child: Icon(
                            _obsecurePassword.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility,
                            color: AppColors.grey,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Appservices.addheight(10),
                ValueListenableBuilder(
                  valueListenable: _obsecurePassword,
                  builder: (context, value, child) {
                    return TextFormField(
                      focusNode: passwordFocusNode,
                      controller: _passwordController,
                      obscureText: _obsecurePassword.value,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: AppColors.blackColor)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: AppColors.blackColor)),
                        hintText: "Password",
                        labelText: "password",
                        prefixIcon: Icon(
                          Icons.lock_rounded,
                          color: AppColors.grey,
                        ),
                        suffixIcon: InkWell(
                          onTap: () {
                            _obsecurePassword.value = !_obsecurePassword.value;
                          },
                          child: Icon(
                            _obsecurePassword.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility,
                            color: AppColors.grey,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Appservices.addheight(20),
                CheckboxListTile.adaptive(
                  fillColor: MaterialStateProperty.all(AppColors.yellow),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  visualDensity: VisualDensity(horizontal: -4),
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(
                    "Remember me ",
                    style: GetTextTheme.fs12_medium
                        .copyWith(color: AppColors.blackColor),
                  ),
                  value: isChecked,
                  onChanged: (value) => setState(() {
                    isChecked = value!;
                  }),
                ),
                Appservices.addheight(40.h),
                CustomElevatedButton(
                    style: GetTextTheme.fs16_regular,
                    foreground_clr: AppColors.whiteColor,
                    color: AppColors.yellow,
                    btnName: "Continue",
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => accountcompletedailog(),
                      );
                      // Appservices.pushto(context, otp_screen());
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
