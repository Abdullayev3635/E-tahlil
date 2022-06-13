import 'package:dartz/dartz.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/network/network_info.dart';
import 'package:etahlil/features/kutilmoqda/data/datasoursec/yuborilmagan_local_datasources.dart';
import 'package:etahlil/features/kutilmoqda/data/model/not_send_model1.dart';
import 'package:etahlil/features/kutilmoqda/domain/repository/yuborilmagan_repository.dart';

import '../datasoursec/yuborilmagan_remote_datasources.dart';

class NotSendRepositoryImpl extends NotSendRepository {
  final NotSendDataSourcesImpl notSendDataSourcesImpl;
  final NotSendRemoteDatasource notSendRemoteDataSourcesImpl;
  final NetworkInfo networkInfo;

  NotSendRepositoryImpl(
      {required this.notSendDataSourcesImpl,
      required this.notSendRemoteDataSourcesImpl,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<NotSendModel>>> getNotSends() async {
    try {
      final result = await notSendDataSourcesImpl.getNotSends();
      return Right(result);
    } on LocalFailure {
      return const Left(ServerFailure("Маълумот юкланишда хатолик бўлди"));
    }
  }

  @override
  Future<Either<Failure, dynamic>> setNotSends(
      NotSendModel notSendModel) async {
    if (await networkInfo.isConnected) {
      try {
        var result = await notSendRemoteDataSourcesImpl.setData(notSendModel);
        if (result == 200) {
          result = await notSendDataSourcesImpl.getDeleted(notSendModel);
        } else {
          result = await notSendDataSourcesImpl.getNotSends();
        }
        return Right(result);
      } on ServerFailure {
        return const Left(ServerFailure("Маълумот юкланишда хатолик бўлди"));
      }
    } else {
      return const Left(ServerFailure("Маълумот юкланишда хатолик бўлди"));
    }
  }
}
