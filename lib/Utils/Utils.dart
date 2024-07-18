import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:book_salon_app/helpers/color_sheet.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextfocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextfocus);
  }

  static toastmassage(String massage) {
    Fluttertoast.showToast(
        msg: massage,
        backgroundColor: AppColors.orange,
        textColor: Colors.amber);
  }

  static FlushbarErrorMassage(String massage, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          icon: Icon(Icons.error),
          duration: Duration(seconds: 3),
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(10),
          backgroundGradient: LinearGradient(
            colors: [
              Colors.pink.shade500,
              Colors.pink.shade300,
              Colors.pink.shade100
            ],
            stops: [0.4, 0.7, 1],
          ),
          boxShadows: [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(3, 3),
              blurRadius: 3,
            ),
          ],
          dismissDirection: FlushbarDismissDirection.HORIZONTAL,
          forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
          title: 'Error',
          flushbarPosition: FlushbarPosition.TOP,
          message: massage,
          messageSize: 17,
        )..show(context));
  }

  static snakbar(String massage, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.pink, content: Text(massage)));
  }
}
