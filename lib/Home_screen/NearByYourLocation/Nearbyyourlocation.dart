import 'package:book_salon_app/Home_screen/NearByYourLocation/Haircuts.dart';
import 'package:book_salon_app/Home_screen/NearByYourLocation/Makeup.dart';
import 'package:book_salon_app/Home_screen/NearByYourLocation/Manicure.dart';
import 'package:book_salon_app/Home_screen/NearByYourLocation/Massage.dart';
import 'package:book_salon_app/Salon_details.dart/solon_details.dart';
import 'package:book_salon_app/backanddata/dummydata.dart';
import 'package:book_salon_app/componants/dummydata.dart';
import 'package:book_salon_app/componants/filterdatahome.dart';
import 'package:book_salon_app/componants/listtile_solon.dart';
import 'package:book_salon_app/controlers/app_controllers.dart';
import 'package:book_salon_app/helpers/allaapdatalisttile.dart';
import 'package:book_salon_app/helpers/app_services.dart';
import 'package:book_salon_app/helpers/color_sheet.dart';
import 'package:book_salon_app/helpers/text_theme.dart';
import 'package:book_salon_app/model/allappmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Nearbyyourlocation extends StatefulWidget {
  Nearbyyourlocation({
    super.key,
  });

  @override
  State<Nearbyyourlocation> createState() => _NearbyyourlocationState();
}

class _NearbyyourlocationState extends State<Nearbyyourlocation> {
  var curruntindex = 0;
  var curruntindex1 = 1;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<appController>(context);
    final alldata = provider.get_salon_detail;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.tranceparent,
        title: Text(
          "Nearby Your Location",
          style: GetTextTheme.fs16_medium.copyWith(color: AppColors.blackColor),
        ),
        actions: [Icon(Icons.search), Appservices.addWidth(15)],
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 10,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: dummydatalist.name_textbutton.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: curruntindex == index
                                  ? AppColors.yellow
                                  : AppColors.whiteColor,
                              side: BorderSide(color: AppColors.yellow)),
                          onPressed: () {
                            setState(() {
                              curruntindex = index;
                            });
                          },
                          child: Text(
                            dummydatalist.name_textbutton[index]["title"],
                            style: GetTextTheme.fs14_regular.copyWith(
                                color: curruntindex == index
                                    ? AppColors.whiteColor
                                    : AppColors.yellow),
                          )),
                    );
                  },
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: Switchbtn(
                        dummydatalist.name_textbutton[curruntindex]["id"],
                        context)
                    .length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile_Salon(
                      modal: Switchbtn(
                          dummydatalist.name_textbutton[curruntindex]["id"],
                          context)[index],
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SalonDetails(model: alldata[index]),
                            ));
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class All_switch_case {
  near_by_location_switch(int i) {
    switch (i) {
      case 0:
        return Nearbyyourlocation();
      case 1:
        return Haircut_screen();
      case 2:
        return Mekeup_screen();
      case 3:
        return Manicure_screen();
      case 4:
        return Massage_screen();
      default:
    }
  }
}
