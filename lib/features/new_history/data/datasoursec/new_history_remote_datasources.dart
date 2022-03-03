import 'dart:convert';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/utils/api_path.dart';
import 'package:etahlil/features/new_history/data/models/new_history_model.dart';
import 'package:http/http.dart' as http;

abstract class NewHistoryRemoteDatasource {
  Future<List<NewHistoryModel>> getNewHistory(int userId);
}

class NewHistoryRemoteDatasourceImpl extends NewHistoryRemoteDatasource {
  @override
  Future<List<NewHistoryModel>> getNewHistory(int userId) async {
    List<NewHistoryModel> list = [];
    try {
      final response = await http
          .get(Uri.parse(baseUrl + newHistoryPHP + userId.toString()));
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
