import 'dart:convert';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/utils/api_path.dart';
import 'package:etahlil/features/home/data/models/category_model1.dart';
import 'package:etahlil/features/home/data/models/sub_category_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class SelectPartRemoteDatasource {
  Future<List<CategoryModel>> getSelectPart(int userId);

  Future<List<SubCategoryModel>> getSelectSubPart(String categoryId);
}

class SelectPartRemoteDatasourceImpl extends SelectPartRemoteDatasource {
  final SharedPreferences sharedPreferences;
  final http.Client client;
  SelectPartRemoteDatasourceImpl(
      {required this.sharedPreferences, required this.client});

  @override
  Future<List<CategoryModel>> getSelectPart(int userId) async {
    List<CategoryModel> list = [];
    try {
      final response = await client.get(
        Uri.parse(baseUrl + categoriesPHP),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          "Authorization": "Bearer ${sharedPreferences.getString("token")}"
        },
      );
      if (response.statusCode == 200) {
        final parsed = json.decode(response.body);
        for (int i = 0; i < (parsed["data"] as List).length; i++) {
          list.add(CategoryModel.fromJson(parsed["data"][i]));
        }
        return list;
      } else {
        return [];
      }
    } on InputFormatterFailure {
      return [];
    }
  }

  @override
  Future<List<SubCategoryModel>> getSelectSubPart(String categoryId) async {
    List<SubCategoryModel> list = [];
    try {
      final response = await client.get(
        Uri.parse(baseUrl +
            subcategoriesPHP +
            categoryId +
            "/" +
            sharedPreferences.getString("id")!),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          "Authorization": "Bearer ${sharedPreferences.getString("token")}"
        },
      );
      if (response.statusCode == 200) {
        final parsed = json.decode(response.body);
        for (int i = 0; i < (parsed["data"] as List).length; i++) {
          list.add(SubCategoryModel.fromJson(parsed["data"][i]));
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
