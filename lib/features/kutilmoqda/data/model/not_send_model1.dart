import 'package:etahlil/features/send_data/data/models/img_model.dart';
import 'package:hive/hive.dart';

part 'not_send_model1.g.dart';

@HiveType(typeId: 5)
class NotSendModel extends HiveObject {
  @HiveField(0)
  String? userId;
  @HiveField(1)
  String? categoryId;
  @HiveField(2)
  String? subCategoryId;
  @HiveField(3)
  String? orinbosarIshtirokida;
  @HiveField(4)
  String? title;
  @HiveField(5)
  String? text;
  @HiveField(6)
  List<ImgModel>? imagesList;
  @HiveField(7)
  String? categoryName;
  @HiveField(8)
  String? subCategoryName;

  NotSendModel(
      {this.userId,
      this.categoryId,
      this.subCategoryId,
      this.orinbosarIshtirokida,
      this.title,
      this.text,
      this.categoryName,
      this.subCategoryName,
      this.imagesList});

  NotSendModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    categoryId = json['category_id'];
    subCategoryId = json['subCategory_id'];
    orinbosarIshtirokida = json['orinbosar_ishtirokida'];
    title = json['title'];
    text = json['text'];
    title = json['categoryName'];
    text = json['subCategoryName'];
    if (json['images_list'] != null) {
      imagesList = <ImgModel>[];
      json['images_list'].forEach((v) {
        imagesList!.add(ImgModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['category_id'] = categoryId;
    data['subCategory_id'] = subCategoryId;
    data['orinbosar_ishtirokida'] = orinbosarIshtirokida;
    data['title'] = title;
    data['text'] = text;
    if (imagesList != null) {
      data['images_list'] = imagesList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
