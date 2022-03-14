import 'dart:convert';

import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/utils/api_path.dart';
import 'package:etahlil/features/auth/data/model/auth_model.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDatasource {
  Future<dynamic> setData(String code, String tel, String mac);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final http.Client client;

  AuthRemoteDatasourceImpl({required this.client});

  @override
  Future<dynamic> setData(String code, String tel, String mac) async {
    List<UserModel> _list = [];
    try {
      var body = {
        "verification_code": code,
        "mac_address": mac,
        "phone_number": tel,
      };

      final response = await client.post(
        Uri.parse(baseUrl + authPHP),
        body: jsonEncode(body),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        if (response.body.toString() == "0") {
          return "0";
        } else {
          final parsed = json.decode(response.body);
          for (int i = 0; i < (parsed["data"] as List).length; i++) {
            _list.add(UserModel.fromJson(parsed["data"][i]));
          }
          return _list;
        }
      } else {
        return [];
      }
    } on InputFormatterFailure {
      return [];
    }
  }
}
