import 'package:book_salon_app/helpers/color_sheet.dart';
import 'package:book_salon_app/helpers/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class Customtextformfilled extends StatefulWidget {
  TextEditingController? controller;
  IconData? icon;
  bool darkHint;
  Function? onSufixPressed;
  String? hintText;
  Function(String?)? validator;
  bool obsecure;
  Color? fillcolor;
  Function(String?)? onchange;
  Function? onPressed;
  Customtextformfilled(
      {super.key,
      this.icon,
      this.onSufixPressed,
      this.darkHint = false,
      this.obsecure = false,
      this.controller,
      this.hintText,
      this.onchange,
      this.validator,
      this.fillcolor,
      this.onPressed});

  @override
  State<Customtextformfilled> createState() => _CustomtextformfilledState();
}

class _CustomtextformfilledState extends State<Customtextformfilled> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: GetTextTheme.fs12_medium.copyWith(color: AppColors.blackColor),
        controller: widget.controller,
        obscureText: widget.obsecure,
        onChanged: widget.onchange,
        validator: widget.validator == null
            ? null
            : (value) => widget.validator!(value),
        decoration: InputDecoration(
            filled: true,
            fillColor: widget.fillcolor,
            hintText: widget.hintText,
            hintStyle: GetTextTheme.fs14_regular.copyWith(
                color:
                    widget.darkHint ? AppColors.grey100 : AppColors.greyColor),
            suffixIcon: IconButton(
                color: AppColors.greyscale,
                onPressed: widget.onSufixPressed != null
                    ? () => widget.onSufixPressed!()
                    : null,
                icon: Icon(widget.icon)),
            contentPadding:
                EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.blackColor)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.blackColor))));
  }
}
