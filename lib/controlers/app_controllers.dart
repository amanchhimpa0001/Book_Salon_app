import 'dart:io';

import 'package:book_salon_app/model/allappmodel.dart';
import 'package:book_salon_app/respository/app_repository.dart';
import 'package:book_salon_app/respository/auth_repo/auth_repository.dart';
import 'package:flutter/material.dart';

class appController extends ChangeNotifier {
  final _all_data = SolonRepository();
  List<salon_detail_model> _user_detail = [];
  List<salon_detail_model> get get_salon_detail => _user_detail;

  Future<dynamic> salon_api() async {
    try {
      print("step-=--=--==--=-==-=--=-=--=-=---=-=--=--0");
      final data = await SolonRepository().Solon_all_detail_api();
      print(data);
      // print(data);
      // final all_data =
      //     data.map((e) => salon_detail_model.fromsalon_model(e)).toList();

      // _user_detail = all_data;
      notifyListeners();
      // print("step-=--=--==--=-==-=--=-=--=-=---=-=--=--1");
      // print(all_data);
    } catch (e) {
      print(e.toString());
      if (e is SocketException) {
        print(e.toString());
      }
    }
  }

  List<salon_detail_model> _bookmarkdata = [];
  List<salon_detail_model> get bookmarkdata => _bookmarkdata;
  adddata(salon_detail_model bookmark) {
    _bookmarkdata.add(bookmark);
    notifyListeners();
  }

  bool bookmarkvalue(String id) {
    return _bookmarkdata.any((element) => element.salon_id == id);
  }

  removedata(salon_detail_model modeldata) {
    _bookmarkdata.remove(modeldata);
    notifyListeners();
  }
}
