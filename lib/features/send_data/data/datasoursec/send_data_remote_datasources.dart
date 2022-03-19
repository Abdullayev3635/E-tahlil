import 'dart:async';
import 'dart:convert';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/utils/api_path.dart';
import 'package:etahlil/features/send_data/data/models/img_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../presentetion/bloc/send_data_bloc.dart';

abstract class SendDataRemoteDatasource {
  Future<bool> setData(String userId, int subId, int subCategoryId,
      int presenceOfDeputy, String title, String text, List<ImgModel> images);
}

class SendDataRemoteDatasourceImpl implements SendDataRemoteDatasource {
  final SharedPreferences sharedPreferences;
  final http.Client client;
  SendDataRemoteDatasourceImpl(
      {required this.sharedPreferences, required this.client});


  final _user = StreamController<int>();
  Sink get updateUser => _user.sink;
  Stream<int> get user => _user.stream;

  @override
  Future<bool> setData(
      String userId,
      int subId,
      int subCategoryId,
      int presenceOfDeputy,
      String title,
      String text,
      List<ImgModel> images) async {
    try {
      var json = jsonEncode(images.map((e) => e.toJson()).toList());

      var body = {
        "user_id": userId.toString(),
        "category_id": subId.toString(),
        "subCategory_id": subCategoryId.toString(),
        "orinbosar_ishtirokida": presenceOfDeputy.toString(),
        "title": title,
        "text": text,
        "images_list": json,
      };

      final streamedRequest = http.StreamedRequest("POST", Uri.parse(baseUrl + worksPHP),);
      streamedRequest.headers['Content-Type'] = 'application/json; charset=UTF-8';
      streamedRequest.headers['Accept'] = 'application/json';
      streamedRequest.headers['Authorization'] = "Bearer ${sharedPreferences.getString("token")}";


      var transferredLength = 0;
      var uploadProgress = 0.0;
      var stringEncodedPayload = jsonEncode(body);
      var totalLength = stringEncodedPayload.length;

      Stream.value(stringEncodedPayload)
          .transform(utf8.encoder)
          .listen((chunk) {
        transferredLength += chunk.length;
        uploadProgress = transferredLength / totalLength;
        debugPrint("Chunk: ${chunk.length}, transferred: $transferredLength, progress: $uploadProgress");
        streamedRequest.sink.add(chunk);
        updateUser.add((uploadProgress*100).round());
      }, onDone: () {
        debugPrint("Done. Total: $totalLength, transferred: $transferredLength, progress: $uploadProgress");
        streamedRequest.sink.close();
      });

      final response = await client.send(streamedRequest).then(http.Response.fromStream);

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on InputFormatterFailure {
      return false;
    }
  }
}
