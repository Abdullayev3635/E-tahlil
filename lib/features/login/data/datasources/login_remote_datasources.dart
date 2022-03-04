import 'dart:convert';

import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/utils/api_path.dart';
import 'package:etahlil/features/auth/data/model/auth_model.dart';
import 'package:http/http.dart' as http;

abstract class LoginRemoteDatasource {
  Future<dynamic> setData(String tel, String macAddress);
}

class LoginRemoteDatasourceImpl implements LoginRemoteDatasource {
  @override
  Future<dynamic> setData(String tel, String macAddress) async {
    List<UserModel> _list = [];
    try {
      var body = {
        "phone_number": tel,
        "mac_address": macAddress,
      };

      final response =
          await http.post(Uri.parse(baseUrl + loginPHP), body: body);
      if (response.statusCode == 200) {
        if (response.body.toString() == "1") {
          return response.body.toString();
        } else if (response.body.toString() == "0") {
          return response.body.toString();
        } else {
          final parsed = json.decode(response.body);
          for (int i = 0; i < (parsed["data"] as List).length; i++) {
            _list.add(UserModel.fromJson(parsed["data"][i]));
          }
          return _list;
        }
      } else {
        return "0";
      }
    } on InputFormatterFailure {
      return "500";
    }
  }
}
