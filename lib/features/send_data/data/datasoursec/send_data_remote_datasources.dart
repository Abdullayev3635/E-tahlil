import 'dart:convert';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/utils/api_path.dart';
import 'package:etahlil/features/send_data/data/models/send_model.dart';
import 'package:http/http.dart' as http;

abstract class SendDataRemoteDatasource {
  Future<bool> setData(int userId, int subId, int subCategoryId,
      int presenceOfDeputy, String title, String text, List<SendModel> images);
}

class SendDataRemoteDatasourceImpl implements SendDataRemoteDatasource {
  @override
  Future<bool> setData(
      int userId,
      int subId,
      int subCategoryId,
      int presenceOfDeputy,
      String title,
      String text,
      List<SendModel> images) async {
    try {
      var json = jsonEncode(images.map((e) => e.toJson()).toList());

      var body = {
        "user_id": userId.toString(),
        "category_id": subId.toString(),
        "subCategory_id": subCategoryId.toString(),
        "orinbosar_ishtirokida": presenceOfDeputy.toString(),
        "title": title,
        "text": text,
        "images_list": json,
      };

      final response =
          await http.post(Uri.parse(baseUrl + worksPHP), body: body);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on InputFormatterFailure {
      return false;
    }
  }
}
