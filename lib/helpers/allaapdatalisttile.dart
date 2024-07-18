import 'package:book_salon_app/controlers/app_controllers.dart';
import 'package:book_salon_app/helpers/app_services.dart';
import 'package:book_salon_app/helpers/color_sheet.dart';
import 'package:book_salon_app/helpers/text_theme.dart';
import 'package:book_salon_app/model/allappmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ListTile_Salon extends StatefulWidget {
  salon_detail_model modal;
  Function onPressed;
  Icon? sufficicon;
  Function? Suffic_ontab;
  // bool value;

  ListTile_Salon({
    super.key,
    required this.modal,
    this.sufficicon,
    // this.value = false,
    this.Suffic_ontab,
    required this.onPressed,
  });

  @override
  State<ListTile_Salon> createState() => _ListTile_SalonState();
}

class _ListTile_SalonState extends State<ListTile_Salon> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<appController>(context);
    final data = widget.modal.salon_all_data_list
        ?.firstWhere((element) => element.type == "Basic")
        .salon_data_;
    bool databool = provider.bookmarkdata
        .any((element) => element.salon_id == widget.modal.salon_id);
    return InkWell(
      onTap: () {
        widget.onPressed();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  data!.salonimage.toString(),
                  scale: 6,
                ),
              ),
              Appservices.addWidth(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.salonname.toString(),
                      style: GetTextTheme.fs16_medium),
                  Appservices.addheight(2),
                  Text("Hisar", style: TextStyle(color: AppColors.grey)),
                  Appservices.addheight(2),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        size: 15,
                        color: AppColors.orange,
                      ),
                      Appservices.addWidth(3),
                      Text("2 km", style: TextStyle(color: AppColors.grey)),
                      Appservices.addWidth(5),
                      Icon(
                        Icons.star,
                        size: 15,
                        color: AppColors.orange,
                      ),
                      Appservices.addWidth(3),
                      Text(data.salonrating.toString(),
                          style: TextStyle(color: AppColors.grey))
                    ],
                  )
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              widget.Suffic_ontab != null
                  ? widget.Suffic_ontab!()
                  : {
                      if (databool)
                        {
                          provider.removedata(widget.modal),
                        }
                      else
                        {provider.adddata(widget.modal)}
                    };
            },
            icon: databool
                ? Icon(
                    Icons.bookmark,
                    color: AppColors.darkred,
                  )
                : Icon(
                    Icons.bookmark_outline,
                    color: AppColors.orange,
                  ),
          )
        ],
      ),
    );
  }
}
