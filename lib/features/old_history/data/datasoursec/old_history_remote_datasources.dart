import 'dart:convert';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/utils/api_path.dart';
import 'package:etahlil/features/old_history/data/models/old_history_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class OldHistoryRemoteDatasource {
  Future<List<OldHistoryModel>> getOldHistory(
      int categoryId, int subCategoryId, String startDate, String endDate);
}

class OldHistoryRemoteDatasourceImpl extends OldHistoryRemoteDatasource {
  final SharedPreferences sharedPreferences;

  OldHistoryRemoteDatasourceImpl(this.sharedPreferences);

  @override
  Future<List<OldHistoryModel>> getOldHistory(int categoryId, int subCategoryId,
      String startDate, String endDate) async {
    const Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var body = {
      "start_date": startDate,
      "end_date": endDate,
      "user_id": sharedPreferences.getString("id")!,
      "category_id": categoryId,
      "subCategory_id": subCategoryId
    };
    List<OldHistoryModel> list = [];
    try {
      final response = await http.post(
        Uri.parse(baseUrl + oldHistoryPHP),
        body: jsonEncode(body),
        headers: header,
      );
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
