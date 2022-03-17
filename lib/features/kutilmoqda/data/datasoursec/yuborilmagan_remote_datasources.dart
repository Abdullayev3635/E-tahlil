import 'dart:convert';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/utils/api_path.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/not_send_model.dart';

abstract class NotSendRemoteDatasource {
  Future<dynamic> setData(NotSendModel notSendMode);
}

class NotSendRemoteDatasourceImpl implements NotSendRemoteDatasource {
  final SharedPreferences sharedPreferences;
  final http.Client client;

  NotSendRemoteDatasourceImpl(
      {required this.sharedPreferences, required this.client});

  @override
  Future<dynamic> setData(
    NotSendModel notSendModel,
  ) async {
    try {
      var json =
          jsonEncode(notSendModel.imagesList!.map((e) => e.toJson()).toList());

      var body = {
        "user_id": sharedPreferences.get("id"),
        "category_id": notSendModel.categoryId.toString(),
        "subCategory_id": notSendModel.subCategoryId.toString(),
        "orinbosar_ishtirokida": notSendModel.orinbosarIshtirokida.toString(),
        "title": notSendModel.title,
        "text": notSendModel.text,
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
      return response.statusCode;
    } on InputFormatterFailure {
      return false;
    }
  }
}
