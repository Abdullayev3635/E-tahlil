import 'dart:convert';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/utils/api_path.dart';
import 'package:etahlil/features/old_history/data/models/old_history_model.dart';
import 'package:http/http.dart' as http;

abstract class OldHistoryRemoteDatasource {
  Future<List<OldHistoryModel>> getOldHistory(int userId);
}

class OldHistoryRemoteDatasourceImpl extends OldHistoryRemoteDatasource {
  @override
  Future<List<OldHistoryModel>> getOldHistory(int userId) async {
    List<OldHistoryModel> list = [];
    try {
      final response = await http
          .get(Uri.parse(baseUrl + oldHistoryPHP + userId.toString()));
      if (response.statusCode == 200) {
        final parsed = json.decode(response.body);
        for (int i = 0; i < (parsed["data"] as List).length; i++) {
          list.add(OldHistoryModel.fromJson(parsed["data"][i]));
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
