import 'dart:convert';

import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/utils/api_path.dart';
import 'package:etahlil/features/profile/data/models/prof_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProfRemoteDatasource {
  Future<dynamic> setData(String userId);
}

class ProfRemoteDatasourceImpl implements ProfRemoteDatasource {
  final SharedPreferences sharedPreferences;
  final http.Client client;
  ProfRemoteDatasourceImpl(
      {required this.sharedPreferences, required this.client});

  @override
  Future<dynamic> setData(String userId) async {
    ProfModel? _list;
    try {
      final response = await client.get(
        Uri.parse(baseUrl + profilePHP + userId),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          "Authorization": "Bearer ${sharedPreferences.getString("token")}"
        },
      );
      if (response.statusCode == 200) {
        final parsed = json.decode(response.body);
        _list = ProfModel(
            id: parsed["data"]["id"],
            name: parsed["data"]["name"],
            regionName: parsed["data"]["region_name"],
            sectorId: parsed["data"]["sector_id"],
            phoneNumber: parsed["data"]["phone_number"],
            viloyatBoyicha: parsed["data"]["viloyat_boyicha"],
            tumanBoyicha: parsed["data"]["tuman_boyicha"],
            barchaJonatmalar: parsed["data"]["barcha_jonatmalar"],
            sectorKotibiKormoqda: parsed["data"]["sector_kotibi_kormoqda"],
            rejaGrafikBoyicha: parsed["data"]["reja_grafik_boyicha"],
            bajarilishiKerakIshlar: parsed["data"]["bajarilishi_kerak_ishlar"]);
        return _list;
      }
    } on InputFormatterFailure {
      return "500";
    }
  }
}
