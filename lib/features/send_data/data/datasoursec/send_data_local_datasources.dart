import 'dart:convert';

import 'package:etahlil/core/utils/app_constants.dart';
import 'package:etahlil/features/send_data/data/models/img_model.dart';
import 'package:etahlil/features/send_data/data/models/send_data_model.dart';
import 'package:hive/hive.dart';

abstract class SendDataLocalDatasource {
  Future<bool> setData(String userId, int subId, int subCategoryId,
      int presenceOfDeputy, String title, String text, List<ImgModel> images);
}

class SendDataLocalDatasourceImpl implements SendDataLocalDatasource {
  @override
  Future<bool> setData(
      String userId,
      int subId,
      int subCategoryId,
      int presenceOfDeputy,
      String title,
      String text,
      List<ImgModel> images) async {
    final json = jsonEncode(images.map((e) => e.toJson()).toList());
    final body = {
      "user_id": userId.toString(),
      "category_id": subId.toString(),
      "subCategory_id": subCategoryId.toString(),
      "orinbosar_ishtirokida": presenceOfDeputy.toString(),
      "title": title,
      "text": text,
      "images_list": json,
    };
    // List<SendDataModel> list = [];
    // list.add(SendDataModel(
    //   userId: userId.toString(),
    //   categoryId: subId.toString(),
    //   subCategoryId: subCategoryId.toString(),
    //   orinbosarIshtirokida: presenceOfDeputy.toString(),
    //   title: title,
    //   text: text,
    //   imagesList: images,
    // ));
    try {
      final box = Hive.box(forSendBox);
      box.add(jsonEncode(body));
      return true;
    } catch (e) {
      return false;
    }
  }
}
