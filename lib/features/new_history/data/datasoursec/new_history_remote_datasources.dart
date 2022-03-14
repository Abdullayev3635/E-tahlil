import 'dart:convert';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/utils/api_path.dart';
import 'package:etahlil/features/new_history/data/models/new_history_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class NewHistoryRemoteDatasource {
  Future<List<NewHistoryModel>> getNewHistory(int userId);
}

class NewHistoryRemoteDatasourceImpl extends NewHistoryRemoteDatasource {
  final SharedPreferences sharedPreferences;

  final http.Client client;
  NewHistoryRemoteDatasourceImpl(
      {required this.sharedPreferences, required this.client});

  @override
  Future<List<NewHistoryModel>> getNewHistory(int userId) async {
    List<NewHistoryModel> list = [];
    try {
      final response = await client.get(
        Uri.parse(baseUrl + newHistoryPHP + sharedPreferences.getString("id")!),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          "Authorization": "Bearer ${sharedPreferences.getString("token")}"
        },
      );
      if (response.statusCode == 200) {
        final parsed = json.decode(response.body);
        for (int i = 0; i < (parsed["data"] as List).length; i++) {
          list.add(NewHistoryModel.fromJson(parsed["data"][i]));
        }
        return list;
      } else {
        return [];
      }
    } on InputFormatterFailure {
      return [];
    }
  }
}
