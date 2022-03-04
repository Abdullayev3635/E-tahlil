import 'package:dartz/dartz.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/network/network_info.dart';
import 'package:etahlil/features/send_data/data/datasoursec/send_data_local_datasources.dart';
import 'package:etahlil/features/send_data/data/datasoursec/send_data_remote_datasources.dart';
import 'package:etahlil/features/send_data/data/models/send_model.dart';
import 'package:etahlil/features/send_data/domain/repository/send_data_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SendDataRepositoryImpl extends SendDataRepository {
  final SendDataRemoteDatasourceImpl dataRemoteDatasource;
  final SendDataLocalDatasourceImpl dataLocalDatasource;
  final SharedPreferences sharedPreferences;
  final NetworkInfo networkInfo;

  SendDataRepositoryImpl(
      {required this.dataRemoteDatasource,
      required this.dataLocalDatasource,
      required this.sharedPreferences,
      required this.networkInfo});

  @override
  Future<Either<Failure, bool>> sendData(
      int userId,
      int subId,
      int subCategoryId,
      int presenceOfDeputy,
      String title,
      String text,
      List<SendModel> images) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await dataRemoteDatasource.setData(
            sharedPreferences.getString("id") ?? "0",
            subId,
            subCategoryId,
            presenceOfDeputy,
            title,
            text,
            images);
        return Right(result);
      } on ServerFailure {
        return const Left(ServerFailure("Маълумот юкланишда хатолик бўлди"));
      }
    } else {
      return const Left(
          NoConnectionFailure("Интернет билан алоқани қайта текширинг"));
    }
  }
}
