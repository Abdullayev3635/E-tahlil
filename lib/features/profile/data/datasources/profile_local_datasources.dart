import 'package:etahlil/core/utils/app_constants.dart';
import 'package:etahlil/features/profile/data/models/prof_model.dart';
import 'package:hive/hive.dart';

abstract class ProfileLocalDataSources {
  Future<ProfModel> getProf();

  Future<bool> setProf(ProfModel list);
}

class ProfileLocalDataSourcesImpl extends ProfileLocalDataSources {
  @override
  Future<ProfModel> getProf() async {
    final box = Hive.box<ProfModel>(profileBox);
    return box.getAt(0)!;
  }

  @override
  Future<bool> setProf(ProfModel list) async {
    try {
      final box = Hive.box<ProfModel>(profileBox);
      box.put(profileBox, list);
      return true;
    } catch (e) {
      return false;
    }
  }
}
