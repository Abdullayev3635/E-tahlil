import 'dart:convert';

import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/utils/api_path.dart';
import 'package:etahlil/features/profile/data/models/prof_model.dart';
import 'package:http/http.dart' as http;

abstract class ProfRemoteDatasource {
  Future<dynamic> setData(String userId);
}

class ProfRemoteDatasourceImpl implements ProfRemoteDatasource {
  @override
  Future<dynamic> setData(String userId) async {
    ProfModel? _list;
    try {
      final response = await http.get(Uri.parse(baseUrl + profilePHP + userId));
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
