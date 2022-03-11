import 'package:hive/hive.dart';
part 'img_model.g.dart';

@HiveType(typeId: 6)
class ImgModel extends HiveObject {
  @HiveField(0)
  String? latLang;
  @HiveField(1)
  String? sana;
  @HiveField(2)
  String? image;

  ImgModel({this.latLang, this.sana, this.image});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latLang'] = latLang;
    data['time'] = sana;
    data['image'] = image;
    return data;
  }

  ImgModel.fromJson(Map<String, dynamic> json) {
    latLang = json['latLang'];
    sana = json['sana'];
    image = json['image'];
  }
}
