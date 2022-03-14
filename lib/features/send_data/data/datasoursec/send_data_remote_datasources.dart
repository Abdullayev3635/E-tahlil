import 'dart:convert';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/utils/api_path.dart';
import 'package:etahlil/features/send_data/data/models/img_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class SendDataRemoteDatasource {
  Future<bool> setData(String userId, int subId, int subCategoryId,
      int presenceOfDeputy, String title, String text, List<ImgModel> images);
}

class SendDataRemoteDatasourceImpl implements SendDataRemoteDatasource {
  final SharedPreferences sharedPreferences;
  final http.Client client;
  SendDataRemoteDatasourceImpl(
      {required this.sharedPreferences, required this.client});

  @override
  Future<bool> setData(
      String userId,
      int subId,
      int subCategoryId,
      int presenceOfDeputy,
      String title,
      String text,
      List<ImgModel> images) async {
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

      final response = await client.post(
        Uri.parse(baseUrl + worksPHP),
        body: jsonEncode(body),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          "Authorization": "Bearer ${sharedPreferences.getString("token")}"
        },
      );

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
