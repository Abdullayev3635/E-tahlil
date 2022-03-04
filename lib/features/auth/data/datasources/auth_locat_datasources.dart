import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/features/auth/data/model/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<bool> setDataLocal(List<UserModel> list);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<bool> setDataLocal(List<UserModel> list) async {
    try {
      sharedPreferences.setString("id", list[0].id.toString());
      sharedPreferences.setString("name", list[0].name.toString());
      sharedPreferences.setString("login", list[0].login.toString());
      sharedPreferences.setString("phone", list[0].phoneNumber.toString());
      sharedPreferences.setString("regionId", list[0].regionId.toString());
      sharedPreferences.setString("sectorId", list[0].sectorId.toString());
      sharedPreferences.setString("token", list[0].token.toString());
      return true;
    } on LocalFailure {
      return false;
    }
  }
}
