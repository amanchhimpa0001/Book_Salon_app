import 'package:book_salon_app/Salon_details.dart/about_us.dart';
import 'package:book_salon_app/Salon_details.dart/gellery.dart';
import 'package:book_salon_app/Salon_details.dart/peckage.dart';
import 'package:book_salon_app/Salon_details.dart/services.dart';
import 'package:book_salon_app/componants/dummydata.dart';
import 'package:book_salon_app/helpers/app_services.dart';
import 'package:book_salon_app/helpers/color_sheet.dart';
import 'package:book_salon_app/helpers/text_theme.dart';
import 'package:book_salon_app/model/allappmodel.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SalonDetails extends StatefulWidget {
  salon_detail_model model;
  SalonDetails({super.key, required this.model});

  @override
  State<SalonDetails> createState() => _SalonDetailsState();
}

class _SalonDetailsState extends State<SalonDetails> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    final data = widget.model.salon_all_data_list
        ?.firstWhere((element) => element.type == "Basic")
        .salon_data_;
    final Addressdata = widget.model.salon_all_data_list
        ?.firstWhere((element) => element.type == "Address")
        .Addressdata;
    final Specialistdata = widget.model.salon_all_data_list
        ?.firstWhere((element) => element.type == "Specialist")
        .specialist;

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Common_Btn(
            //     title: "Book Now",
            //     onpressed: () {
            //       Navigator.pushNamed(context, RouteName.BookAppointment,
            //           arguments: widget.model);
            //     })
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(data!.salonimage,
                fit: BoxFit.cover,
                height: 320,
                width: Appservices.getScreenWidth(context)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  Appservices.addheight(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(data.salonname, style: GetTextTheme.fs24_medium),
                      TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: AppColors.orange),
                          onPressed: () {
                            // Navigator.pushNamed(
                            //     context, RouteName.Reviewspageview);
                          },
                          child: Text("Open",
                              style: GetTextTheme.fs14_medium
                                  .copyWith(color: AppColors.whiteColor)))
                    ],
                  ),
                  Appservices.addheight(10),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: AppColors.orange,
                      ),
                      Appservices.addWidth(10),
                      Text(
                        Addressdata.toString(),
                        style: GetTextTheme.fs12_medium,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: AppColors.orange,
                      ),
                      Appservices.addWidth(5),
                      Text(
                        "4.8 (${data.salonreviews} reviews)",
                        style: GetTextTheme.fs12_medium,
                      )
                    ],
                  ),
                  Appservices.addheight(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // ...List.generate(
                      //     dummydatalist.dummydata.length,
                      //     (index) => Column(
                      //           children: [
                      //             IconButton(
                      //                 style: TextButton.styleFrom(
                      //                     padding: EdgeInsets.all(12),
                      //                     backgroundColor:
                      //                         AppColors.yellowlight),
                      //                 onPressed: () {},
                      //                 icon: Icon(
                      //                   DataController.dummydata[index].icon,
                      //                   color: AppColors.orange,
                      //                 )),
                      //             Text(DataController.dummydata[index].title)
                      //           ],
                      //         )),
                    ],
                  ),
                  Appservices.addheight(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Our Specialist",
                        style: GetTextTheme.fs24_medium,
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: AppColors.orange),
                          onPressed: () {},
                          child: Text(
                            "See All",
                            style: GetTextTheme.fs24_medium
                                .copyWith(color: AppColors.whiteColor),
                          )),
                    ],
                  ),
                  Appservices.addheight(10),
                  AspectRatio(
                    aspectRatio: 3,
                    child: ListView.builder(
                      itemCount: Specialistdata!.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              Image.asset(
                                  Specialistdata[index].Specialistimage),
                              Text(
                                Specialistdata[index].Specialistname,
                                style: GetTextTheme.fs14_regular,
                              ),
                              Text(
                                Specialistdata[index].Specialistwork,
                                style: GetTextTheme.fs10_regular,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Appservices.addheight(20),
                  AspectRatio(
                    aspectRatio: 10,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: currentindex == index
                                      ? AppColors.orange
                                      : AppColors.whiteColor,
                                  side: BorderSide(color: AppColors.orange)),
                              onPressed: () {
                                setState(() {
                                  currentindex = index;
                                });
                              },
                              child: Text(
                                switch_btn(index),
                                style: GetTextTheme.fs14_regular.copyWith(
                                  color: currentindex == index
                                      ? AppColors.whiteColor
                                      : AppColors.orange,
                                ),
                              )),
                        );
                      },
                    ),
                  ),
                  SalonAlldetails(currentindex),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  switch_btn(int index) {
    switch (index) {
      case 0:
        return "About us";
      case 1:
        return "Services";
      case 2:
        return "Package";
      case 3:
        return "Gallery";

      default:
    }
  }

  SalonAlldetails(int index) {
    switch (index) {
      case 0:
        return About_us(
            // salondata: widget.model,
            );
      case 1:
        return our_services(
            // salondata: widget.model,
            );
      case 2:
        return our_pacekage();
      case 3:
        return Our_gallery(
            // salondata: widget.model,
            );

      default:
    }
  }
}
