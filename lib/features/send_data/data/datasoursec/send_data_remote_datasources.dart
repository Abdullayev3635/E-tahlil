import 'package:etahlil/core/network/network_info.dart';
import 'package:etahlil/core/utils/api_path.dart';
import 'package:etahlil/features/send_data/data/models/send_model.dart';
import 'package:http/http.dart' as http;

abstract class SendDataRemoteDatasource {
  Future<bool> setData(
      int userId, int subId, String title, String text, List<SendModel> images);
}

class SendDataRemoteDatasourceImpl implements SendDataRemoteDatasource {
  final NetworkInfo networkInfo;

  SendDataRemoteDatasourceImpl({required this.networkInfo});

  @override
  Future<bool> setData(int userId, int subId, String title, String text,
      List<SendModel> images) async {
    var body = {
      "user_id": userId,
      "category_id": subId,
      "subCategory_id": subId,
      "title": title,
      "text": text,
      "images_list": images,
    };

    final response = await http.post(Uri.parse(baseUrl + worksPHP), body: body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
