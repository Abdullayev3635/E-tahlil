import 'package:etahlil/core/utils/app_constants.dart';
import 'package:hive/hive.dart';

abstract class CategoryLocalDataSource {
  Future<dynamic> getCategory();

  Future<bool> setCategory(dynamic list);
}

class CategoryLocalDataSourceImpl extends CategoryLocalDataSource {
  @override
  Future<dynamic> getCategory() {
    // TODO: implement getCategory
    throw UnimplementedError();
  }

  @override
  Future<bool> setCategory(list) async {
    try {
      final box = Hive.box<Map<dynamic, dynamic>>(categoryBox);
      return true;
    } catch (e) {
      return false;
    }
  }
}
