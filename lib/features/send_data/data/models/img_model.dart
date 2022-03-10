import 'package:http/http.dart';

class ImgModel {
  String? latLang;
  String? sana;
  String? image;

  ImgModel({this.latLang, this.sana, this.image});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latLang'] = latLang;
    data['time'] = sana;
    data['image'] = image;
    return data;
  }
}
