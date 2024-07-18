import 'package:book_salon_app/helpers/image.dart';

class dummydatalist {
  static List<Map<String, dynamic>> Homelocation = [
    {"image": Getimage.haircutimg, "title": "Haircut", "id": "Hair cut"},
    {"image": Getimage.Manicureimg, "title": "Manicure", "id": "Manicure"},
    {"image": Getimage.makeuppimg, "title": "Make up", "id": "Make up"},
    {"image": Getimage.massageimg, "title": "massage", "id": "Massage"},
  ];
  static List<Map<String, dynamic>> name_textbutton = [
    {"title": "All", "id": "All"},
    {"title": "Haircuts", "id": "Haircuts"},
    {
      "title": "Make up",
      "id": "Make up",
    },
    {
      "title": "Manicure",
      "id": "Manicure",
    },
    {
      "title": "Massage",
      "id": "Massage",
    },
  ];

  static List<Map<String, dynamic>> All_btn = [
    {"title": "All", "id": "all"},
    {"title": "Haircuts", "id": "Hair_cut"},
    {"title": "Make up", "id": "Make_up"},
    {"title": "Manicure", "id": "Skin_Care"},
    {"title": "Massage", "id": "Hair_Wash"},
  ];
}
