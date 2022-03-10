import 'package:etahlil/core/utils/app_constants.dart';
import 'package:etahlil/features/home/data/models/category_model.dart';
import 'package:etahlil/features/home/data/models/sub_category_model.dart';
import 'package:hive/hive.dart';

abstract class CategoryLocalDataSource {
  Future<dynamic> getCategory();

  Future<dynamic> getSubCategory();

  Future<bool> setCategory(List<CategoryModel> list);

  Future<bool> setSubCategory(List<SubCategoryModel> list);
}

class CategoryLocalDataSourceImpl extends CategoryLocalDataSource {
  @override
  Future<dynamic> getCategory() async {
    try {
      final box = Hive.box(categoryBox);
      final eventsFromHive = box.get(categoryBox)?.cast<CategoryModel>() ?? [];
      return eventsFromHive;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<bool> setCategory(list) async {
    try {
      final box = Hive.box(categoryBox);
      box.put(categoryBox, list);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<dynamic> getSubCategory() async {
    try {
      final box = Hive.box(subCategoryBox);
      final eventsFromHive =
          box.get(subCategoryBox)?.cast<SubCategoryModel>() ?? [];
      return eventsFromHive;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<bool> setSubCategory(list) async {
    try {
      final box = Hive.box(subCategoryBox);
      box.put(subCategoryBox, list);
      return true;
    } catch (e) {
      return false;
    }
  }
}
