import 'package:etahlil/core/utils/api_path.dart';

class NewHistoryModel {
  int? id;
  String? title;
  String? text;
  List<ImageList>? imageList;
  String? regionName;
  int? sectorId;
  String? sectorName;
  String? date;
  String? orinbosarIshtirokida;
  int? newCount;
  int? sendedCount;
  List<String> imgList = [];

  NewHistoryModel(
      {this.id,
      this.title,
      this.text,
      this.imageList,
      this.regionName,
      this.sectorId,
      this.sectorName,
      this.date,
      this.orinbosarIshtirokida,
      this.newCount,
      this.sendedCount});

  NewHistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    text = json['text'];
    if (json['image_list'] != null) {
      json['image_list'].forEach((v) {
        imgList.add(baseUrlImg + v["image"]);
      });
    }
    regionName = json['region_name'];
    sectorId = json['sector_id'];
    sectorName = json['sector_name'];
    date = json['date'];
    orinbosarIshtirokida = json['orinbosar_ishtirokida'];
    newCount = json['new_count'];
    sendedCount = json['sended_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['text'] = text;
    if (imageList != null) {
      data['image_list'] = imageList!.map((v) => v.toJson()).toList();
    }
    data['region_name'] = regionName;
    data['sector_id'] = sectorId;
    data['sector_name'] = sectorName;
    data['date'] = date;
    data['orinbosar_ishtirokida'] = orinbosarIshtirokida;
    data['new_count'] = newCount;
    data['sended_count'] = sendedCount;
    return data;
  }
}

class ImageList {
  String? image;
  String? latLang;
  String? time;

  ImageList({this.image, this.latLang, this.time});

  ImageList.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    latLang = json['latLang'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['latLang'] = latLang;
    data['time'] = time;
    return data;
  }
}
