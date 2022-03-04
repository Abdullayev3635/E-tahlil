import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/utils/api_path.dart';
import 'package:etahlil/features/auth/data/model/auth_model.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDatasource {
  Future<List<UserModel>> setData(String code);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  @override
  Future<List<UserModel>> setData(String code) async {
    List<UserModel> _list = [];
    try {
      var body = {
        "tel": code,
      };

      final response =
          await http.post(Uri.parse(baseUrl + authPHP), body: body);
      if (response.statusCode == 200) {
        return _list;
      } else {
        return [];
      }
    } on InputFormatterFailure {
      return [];
    }
  }
}
