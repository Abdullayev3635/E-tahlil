import 'package:etahlil/core/utils/app_constants.dart';
import 'package:etahlil/features/old_history/data/models/old_history_model.dart';
import 'package:hive/hive.dart';

abstract class OldHistoryDataSources {
  Future<List<OldHistoryModel>> getOldHistory();
  Future<bool> setOldHistory(List<OldHistoryModel> list);
}

class OldHistoryDataSourcesImpl extends OldHistoryDataSources {
  @override
  Future<List<OldHistoryModel>> getOldHistory() async {
    try {
      final box = Hive.box(oldHistoryBox);
      final eventsFromHive =
          box.get(oldHistoryBox)?.cast<OldHistoryModel>() ?? [];
      return eventsFromHive;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<bool> setOldHistory(list) async {
    try {
      final box = Hive.box(oldHistoryBox);
      box.put(oldHistoryBox, list);
      return true;
    } catch (e) {
      return false;
    }
  }
}
