import 'package:book_salon_app/data/Network/BaseApiServices.dart';
import 'package:book_salon_app/data/Network/NatworkapiServices.dart';
import 'package:book_salon_app/data/Response/app_exception.dart';
import 'package:flutter/material.dart';

class SolonRepository {
  BaseUrls _solondata = NetworkApis();
  Future<dynamic> Solon_all_detail_api() async {
    try {
      var data = await _solondata.solon_getdata("assets/jsons/allapp.json");
      // print("Data Stored :::::: $data");
      return data;
    } catch (e) {
      // print("e checker ::: ${e}");
      if (e is NoInternetException) {
        return NoInternetException(e.toString());
      }
    }
  }
}
