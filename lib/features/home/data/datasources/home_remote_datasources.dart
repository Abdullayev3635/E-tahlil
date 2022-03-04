import 'dart:convert';

import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/utils/api_path.dart';
import 'package:etahlil/features/home/data/models/category_model.dart';
import 'package:etahlil/features/home/data/models/sub_caregory_model.dart';
import 'package:http/http.dart' as http;

abstract class HomeRemoteDatasource {
  Future<List<CategoryModel>> getCategory();

  Future<List<SubCategoryModel>> getSubCategory(int id);
}

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  @override
  Future<List<CategoryModel>> getCategory() async {
    List<CategoryModel> list = [];
    try {
      final response = await http.get(Uri.parse(baseUrl + categoriesPHP));
      if (response.statusCode == 200) {
        final parsed = json.decode(response.body);
        for (int i = 0; i < (parsed["data"] as List).length; i++) {
          list.add(CategoryModel.fromJson(parsed["data"][i]));
        }
        if (list.isNotEmpty) {
          list[0].isCheck = true;
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
  Future<List<SubCategoryModel>> getSubCategory(int id) async {
    List<SubCategoryModel> list = [];
    try {
      final response = await http
          .get(Uri.parse(baseUrl + subcategoriesPHP + id.toString() + "/2"));
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
