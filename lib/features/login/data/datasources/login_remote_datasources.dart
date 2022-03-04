import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/utils/api_path.dart';
import 'package:http/http.dart' as http;

abstract class LoginRemoteDatasource {
  Future<String> setData(String tel, String macAddress);
}

class LoginRemoteDatasourceImpl implements LoginRemoteDatasource {
  @override
  Future<String> setData(String tel, String macAddress) async {
    try {
      var body = {
        "tel": tel,
        "macAddress": macAddress,
      };

      final response =
          await http.post(Uri.parse(baseUrl + loginPHP), body: body);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return "0";
      }
    } on InputFormatterFailure {
      return "500";
    }
  }
}
