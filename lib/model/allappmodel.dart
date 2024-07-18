/**********************************  ***************************** */
class salon_detail_model {
  String salon_id;
  List<salon_all_data_model>? salon_all_data_list;
  salon_detail_model(this.salon_id, this.salon_all_data_list);
  salon_detail_model.fromsalon_model(Map<String, dynamic> json)
      : salon_id = json["salon_id"] ?? "",
        salon_all_data_list = json["Alldata"] != null
            ? (json["Alldata"] as List)
                .map((e) => salon_all_data_model.fromalldata_model(e))
                .toList()
            : null;
}

class salon_all_data_model {
  String? type;
  String? Abouts;
  String? Addressdata;
  Gallery_model? Gallerydata;
  salon_basic_model? salon_data_;
  Map<String, dynamic>? services;
  // Map<String, dynamic>? Specialist;
  List<Specialist>? specialist;
  Map<String, dynamic>? workingtime;
  salon_all_data_model(
      {this.type,
      this.Abouts,
      this.salon_data_,
      this.Gallerydata,
      this.Addressdata,
      this.specialist,
      this.services});
  salon_all_data_model.fromalldata_model(Map<String, dynamic> json)
      : Abouts = json["Abouts"] ?? "",
        salon_data_ = json["data"] != null
            ? salon_basic_model.fromdata_model(json["data"])
            : null,
        type = json["type"] ?? "",
        Addressdata = json["Address"],
        services = json["Services"],
        specialist = json["Specialistdata"] != null
            ? (json["Specialistdata"] as List)
                .map((e) => Specialist.fromJson(e))
                .toList()
            : null,
        // specialist = json["Specialistdata"] != null
        //     ? Specialist.fromJson(json["Specialistdata"])
        //     : null,
        workingtime = json["WorkingHours"],
        Gallerydata = json["Gallary"] != null
            ? Gallery_model.fromgallery_model(json["Gallary"])
            : null;
}

class salon_basic_model {
  String salonname, salonimage;
  int saloncontact;
  double salonrating, salonreviews;
  bool is_salonOpen;
  salon_basic_model(this.salonname, this.salonimage, this.is_salonOpen,
      this.saloncontact, this.salonrating, this.salonreviews);
  salon_basic_model.fromdata_model(Map<String, dynamic> json)
      : salonname = json["salonname"] ?? "",
        salonimage = json["salonimage"] ?? "",
        saloncontact = json["saloncontact"] ?? "",
        salonrating = json["salonrating"] ?? "",
        salonreviews = json["salonreviews"] ?? "",
        is_salonOpen = json["is_salonOpen"] ?? "";
}

class Gallery_model {
  List<String> image;
  List<String> video;
  Gallery_model(this.image, this.video);
  Gallery_model.fromgallery_model(Map<String, dynamic> json)
      : image = json["image"] == null
            ? []
            : (json["image"] as List).map((e) => e.toString()).toList(),
        video = json["video"] == null
            ? []
            : (json["video"] as List).map((e) => e.toString()).toList();
}

class services_model {
  List<String> Hair_cut;
  List<String> Hair_Coloring;
  List<String> Hair_Wash;
  List<String> Shaving;
  List<String> Skin_Care;
  List<String> Make_up;
  services_model(this.Hair_Coloring, this.Hair_Wash, this.Hair_cut,
      this.Make_up, this.Shaving, this.Skin_Care);
  services_model.fromservices_model(Map<String, dynamic> json)
      : Hair_cut = json["Hair_cut"] == null
            ? []
            : (json["Hair_cut"] as List).map((e) => e.toString()).toList(),
        Hair_Coloring = json["Hair_Coloring"] == null
            ? []
            : (json["Hair_Coloring"] as List).map((e) => e.toString()).toList(),
        Hair_Wash = json["Hair_Wash"] == null
            ? []
            : (json["Hair_Wash"] as List).map((e) => e.toString()).toList(),
        Shaving = json["Shaving"] == null
            ? []
            : (json["Shaving"] as List).map((e) => e.toString()).toList(),
        Skin_Care = json["Skin_Care"] == null
            ? []
            : (json["Skin_Care"] as List).map((e) => e.toString()).toList(),
        Make_up = json["Make_up"] == null
            ? []
            : (json["Make_up"] as List).map((e) => e.toString()).toList();
}

class Specialist {
  String Specialistname;
  String Specialistimage;
  String Specialistwork;
  Specialist(this.Specialistimage, this.Specialistname, this.Specialistwork);
  Specialist.fromJson(Map<String, dynamic> json)
      : Specialistimage = json["Specialistimage"],
        Specialistwork = json["Specialistwork"],
        Specialistname = json["Specialistname"];
}
