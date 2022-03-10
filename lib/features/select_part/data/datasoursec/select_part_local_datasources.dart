import 'package:etahlil/core/utils/app_constants.dart';
import 'package:etahlil/features/home/data/models/category_model.dart';
import 'package:etahlil/features/home/data/models/sub_category_model.dart';
import 'package:hive/hive.dart';

abstract class SelectPartLocalDatasource {
  Future<dynamic> getSelectPart(int userId);
  Future<dynamic> getSelectSubPart(String categoryId);
}

class SelectPartLocalDatasourceImpl extends SelectPartLocalDatasource {
  @override
  Future<dynamic> getSelectPart(int userId) async {
    try {
      final box = Hive.box(categoryBox);
      final eventsFromHive = box.get(categoryBox)?.cast<CategoryModel>() ?? [];
      return eventsFromHive;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<dynamic> getSelectSubPart(String categoryId) async {
    try {
      final box = Hive.box(subCategoryBox);
      final eventsFromHive =
          box.get(subCategoryBox)?.cast<SubCategoryModel>() ?? [];
      return eventsFromHive;
    } catch (e) {
      return [];
    }
  }
}
