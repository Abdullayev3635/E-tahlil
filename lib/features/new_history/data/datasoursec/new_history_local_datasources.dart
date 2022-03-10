import 'package:etahlil/core/utils/app_constants.dart';
import 'package:etahlil/features/new_history/data/models/new_history_model.dart';
import 'package:hive/hive.dart';

abstract class NewHistoryDataSources {
  Future<List<NewHistoryModel>> getNewHistory();
  Future<bool> setNewHistory(List<NewHistoryModel> list);
}

class NewHistoryDataSourcesImpl extends NewHistoryDataSources {
  @override
  Future<List<NewHistoryModel>> getNewHistory() async {
    try {
      final box = Hive.box(newHistoryBox);
      final eventsFromHive =
          box.get(newHistoryBox)?.cast<NewHistoryModel>() ?? [];
      return eventsFromHive;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<bool> setNewHistory(list) async {
    try {
      final box = Hive.box(newHistoryBox);
      box.put(newHistoryBox, list);
      return true;
    } catch (e) {
      return false;
    }
  }
}
