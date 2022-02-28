import 'package:http/http.dart';

class SendModel {
  String? latLang;
  String? sana;
  MultipartFile? multipartFile;

  SendModel({this.latLang, this.sana, this.multipartFile});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat_lang'] = latLang;
    data['sana'] = sana;
    data['image'] = multipartFile;
    return data;
  }
}
