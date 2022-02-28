import 'package:shared_preferences/shared_preferences.dart';

abstract class IPassLocalDataSource {
  Future<bool> setCompile(String pass);
}

class PassLocalDataSource implements IPassLocalDataSource {
  final SharedPreferences sharedPreferences;

  PassLocalDataSource({required this.sharedPreferences});

  final String _pass = "0000";

  @override
  Future<bool> setCompile(String pass) async {
    return _pass == pass;
  }
}
