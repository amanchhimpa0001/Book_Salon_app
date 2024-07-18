import 'package:book_salon_app/Home_screen/NearByYourLocation/Nearbyyourlocation.dart';
import 'package:book_salon_app/Home_screen/Notification/Notification.dart';
import 'package:book_salon_app/componants/dummydata.dart';
import 'package:book_salon_app/componants/filterdatahome.dart';
import 'package:book_salon_app/componants/listtile_solon.dart';
import 'package:book_salon_app/componants/text_form_filled.dart';
import 'package:book_salon_app/controlers/app_controllers.dart';
import 'package:book_salon_app/helpers/allaapdatalisttile.dart';
import 'package:book_salon_app/helpers/app_services.dart';
import 'package:book_salon_app/helpers/color_sheet.dart';
import 'package:book_salon_app/helpers/image.dart';
import 'package:book_salon_app/helpers/text_theme.dart';
import 'package:book_salon_app/model/allappmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var currantindex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<appController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          Getimage.splashimg,
          scale: 7,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Appservices.pushto(context, Notification_screen());
              },
              icon: Icon(
                Icons.notifications_none_sharp,
                color: AppColors.grey,
              )),
          IconButton(
              onPressed: () {
                appController().salon_api();
                // print();
              },
              icon: Icon(
                Icons.bookmark_border,
                color: AppColors.grey,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Morning, Daniel",
                style: GetTextTheme.fs24_medium,
              ),
              Appservices.addheight(10),
              Customtextformfilled(
                fillcolor: AppColors.whiteColor,
                icon: Icons.swap_vert,
              ),
              Appservices.addheight(10),
              Image.asset(Getimage.diccontimg),
              Appservices.addheight(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Nearby Your Location",
                    style: GetTextTheme.fs14_regular,
                  ),
                  TextButton(
                      onPressed: () {
                        Appservices.pushto(context, Nearbyyourlocation());
                      },
                      child: Text(
                        "See All",
                        style: GetTextTheme.fs14_regular
                            .copyWith(color: AppColors.yellow),
                      ))
                ],
              ),
              Divider(),
              AspectRatio(
                aspectRatio: 3.4,
                child: ListView.builder(
                  itemCount: dummydatalist.Homelocation.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                Appservices.pushto(
                                    context, Nearbyyourlocation());
                                // arguments:
                                // [
                                //   dummydatalist.Homelocation[index]["title"],
                                //   filterdata(
                                //       dummydatalist.Homelocation[index]["id"],
                                //       context)
                                // ];
                              },
                              icon: Image.asset(
                                dummydatalist.Homelocation[index]["image"]
                                    .toString(),
                              )),
                          Text(
                            dummydatalist.Homelocation[index]["title"],
                          )
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
                  itemCount: dummydatalist.name_textbutton.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: currantindex == index
                                  ? AppColors.yellow
                                  : AppColors.whiteColor,
                              side: BorderSide(color: AppColors.yellow)),
                          onPressed: () {
                            setState(() {
                              currantindex = index;
                            });
                          },
                          child: Text(
                            dummydatalist.name_textbutton[index]["title"],
                            style: GetTextTheme.fs14_regular.copyWith(
                                color: currantindex == index
                                    ? AppColors.whiteColor
                                    : AppColors.yellow),
                          )),
                    );
                  },
                ),
              ),
              Appservices.addheight(20),
              AspectRatio(
                aspectRatio: 1,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    height: 20,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: filterdata(
                          dummydatalist.All_btn[currantindex]["id"], context)
                      .length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile_Salon(
                        modal: filterdata(
                            dummydatalist.All_btn[currantindex]["id"],
                            context)[index],
                        onPressed: () {});
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
