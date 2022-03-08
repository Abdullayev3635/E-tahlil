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

  NewHistoryRemoteDatasourceImpl(this.sharedPreferences);

  @override
  Future<List<NewHistoryModel>> getNewHistory(int userId) async {
    List<NewHistoryModel> list = [];
    try {
      final response = await http
          .get(Uri.parse(baseUrl + newHistoryPHP + sharedPreferences.getString("id")!));
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
