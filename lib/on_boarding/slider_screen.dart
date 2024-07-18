import 'package:book_salon_app/componants/customelevatedbutton.dart';
import 'package:book_salon_app/componants/slider_fuction.dart';
import 'package:book_salon_app/helpers/app_services.dart';
import 'package:book_salon_app/helpers/color_sheet.dart';
import 'package:book_salon_app/helpers/image.dart';
import 'package:book_salon_app/helpers/text_theme.dart';
import 'package:book_salon_app/on_boarding/Create_account_screen.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class slider_screen extends StatefulWidget {
  const slider_screen({super.key});

  @override
  State<slider_screen> createState() => _slider_screenState();
}

class _slider_screenState extends State<slider_screen> {
  List<Widget> slider = [
    Sliderfunction(
        salonimage: Getimage.sliderimg1,
        description: "Find barber and\nsalons easily in your\nhand"),
    Sliderfunction(
        salonimage: Getimage.sliderimg2,
        description: "Book your favourite\nbarber and salon\nquickly"),
    Sliderfunction(
        salonimage: Getimage.sliderimg3,
        description: "Come be handsome\nand beautiful with us\nright now"),
  ];
  int index = 0;  

  CarouselController _carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
                carouselController: _carouselController,
                items: slider,
                options: CarouselOptions(
                  onPageChanged: (i, _) {
                    setState(() {
                      index = i;
                    });
                  },
                  enlargeCenterPage: false,
                  viewportFraction: 1,
                  aspectRatio: 0.56,
                  initialPage: 3,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(slider.length, (i) {
                return Container(
                  margin: EdgeInsets.only(right: 10, bottom: 15),
                  height: 5,
                  width: index == i ? 15 : 30,
                  decoration: BoxDecoration(
                      color: i == index ? AppColors.grey : AppColors.yellow,
                      borderRadius: BorderRadius.circular(50.r)),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomElevatedButton(
                  style: GetTextTheme.fs16_medium,
                  color: AppColors.yellow,
                  foreground_clr: AppColors.whiteColor,
                  btnName: index == slider.length - 1 ? "Get Started" : "Next",
                  onTap: () {
                    index == slider.length - 1
                        ? Appservices.pushto(context, Create_account())
                        : _carouselController.nextPage();
                  }),
            ),
            index != 2
                ? TextButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.only(bottom: 15.h))),
                    onPressed: () {
                      _carouselController.nextPage();
                    },
                    child: Text(
                      "Skip",
                      style: GetTextTheme.fs12_bold
                          .copyWith(color: AppColors.blackColor),
                    ))
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
