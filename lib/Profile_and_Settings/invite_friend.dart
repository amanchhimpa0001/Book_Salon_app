import 'package:book_salon_app/helpers/app_services.dart';
import 'package:book_salon_app/helpers/color_sheet.dart';
import 'package:book_salon_app/helpers/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';

class invite_friend extends StatefulWidget {
  const invite_friend({super.key});

  @override
  State<invite_friend> createState() => _invite_friendState();
}

class _invite_friendState extends State<invite_friend> {
  final FlutterContactPicker _contactPicker = new FlutterContactPicker();
  List<Contact>? _contacts;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.lightgrey,
          title: Text(
            "invite friend",
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
        body: new Center(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new MaterialButton(
                color: Colors.blue,
                child: new Text("Single"),
                onPressed: () async {
                  Contact? contact = await _contactPicker.selectContact();
                  setState(() {
                    _contacts = contact == null ? null : [contact];
                  });
                },
              ),
              if (_contacts != null)
                ..._contacts!.map(
                  (e) => Text(e.toString()),
                )
            ],
          ),
        ),
      ),
    );
  }
}
