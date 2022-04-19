import 'dart:convert';
import 'dart:developer';

import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/utils/api_path.dart';
import 'package:etahlil/features/home/data/models/category_model1.dart';
import 'package:etahlil/features/home/data/models/sub_category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class HomeRemoteDatasource {
  Future<List<CategoryModel>> getCategory();

  Future<List<SubCategoryModel>> getSubCategory(int id);
}

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final SharedPreferences sharedPreferences;
  final http.Client client;

  HomeRemoteDatasourceImpl(
      {required this.sharedPreferences, required this.client});

  @override
  Future<List<CategoryModel>> getCategory() async {
    List<CategoryModel> list = [];

    try {
      final response = await client.get(
        Uri.parse(baseUrl + categoriesPHP + sharedPreferences.getString("id")!),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          "Authorization": "Bearer ${sharedPreferences.getString("token")}"
        },
      );
      if (response.statusCode == 200) {
        try{
          final parsed = json.decode(response.body);
          log('data11: $parsed');
          for (int i = 0; i < (parsed["data"] as List).length; i++) {
            list.add(CategoryModel.fromJson(parsed["data"][i]));
          }
        } catch(e){
          debugPrint(e.toString());
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
      final response = await client.get(
        Uri.parse(
            baseUrl + subcategoriesPHP + sharedPreferences.getString("id")!),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          "Authorization": "Bearer ${sharedPreferences.getString("token")}"
        },
      );
      if (response.statusCode == 200) {
        final parsed = json.decode(response.body);
        log('data11: $parsed');
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
