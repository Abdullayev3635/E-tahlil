import 'img_model.dart';

class SendDataModel {
  String? userId;
  String? categoryId;
  String? subCategoryId;
  String? orinbosarIshtirokida;
  String? title;
  String? text;
  List<ImgModel>? imagesList;

  SendDataModel(
      {required this.userId,
      required this.categoryId,
      required this.subCategoryId,
      required this.orinbosarIshtirokida,
      required this.title,
      required this.text,
      required this.imagesList});

  SendDataModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    categoryId = json['category_id'];
    subCategoryId = json['subCategory_id'];
    orinbosarIshtirokida = json['orinbosar_ishtirokida'];
    title = json['title'];
    text = json['text'];
    imagesList = json['images_list'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['category_id'] = categoryId;
    data['subCategory_id'] = subCategoryId;
    data['orinbosar_ishtirokida'] = orinbosarIshtirokida;
    data['title'] = title;
    data['text'] = text;
    data['images_list'] = imagesList;

    return data;
  }
}
