import 'package:book_salon_app/controlers/app_controllers.dart';
import 'package:book_salon_app/model/allappmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<salon_detail_model> filterdata(String keysvalue, BuildContext context) {
  List<salon_detail_model> alldatalist = [];
  final provider = Provider.of<appController>(context, listen: false);
  final db = provider.get_salon_detail;
  for (var i = 0; i < db.length; i++) {
    salon_detail_model data = db[i];
    final salondata = data.salon_all_data_list!
        .firstWhere((element) => element.type == "Services")
        .services;

    bool valuedata = salondata!.keys.any((element) => element == keysvalue);

    if (valuedata == true) {
      alldatalist.add(db[i]);
    }
  }
  print(alldatalist.length);
  return alldatalist;
}

List<salon_detail_model> Switchbtn(String id, BuildContext context) {
  List<salon_detail_model> alldatalist = [];
  final provider = Provider.of<appController>(context, listen: false);
  switch (id) {
    case "All":
      alldatalist.addAll(provider.get_salon_detail);
    case "Haircuts":
      alldatalist.addAll(filterdata("Hair_cut", context));
    case "Make up":
      alldatalist.addAll(filterdata("Make_up", context));
    case "Manicure":
      alldatalist.addAll(filterdata("Manicure", context));
    case "Massage":
      alldatalist.addAll(filterdata("Massage", context));

    default:
  }
  return alldatalist;
}
