import 'package:dartz/dartz.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/network/network_info.dart';
import 'package:etahlil/features/select_part/data/datasoursec/select_part_remote_datasources.dart';
import 'package:etahlil/features/select_part/domain/repository/select_part_repository.dart';

class SelectPartRepositoryImpl extends SelectPartRepository {
  final SelectPartRemoteDatasourceImpl selectPartRemoteDatasourceImpl;
  final NetworkInfo networkInfo;

  SelectPartRepositoryImpl(
      {required this.selectPartRemoteDatasourceImpl,
      required this.networkInfo});

  @override
  Future<Either<Failure, dynamic>> getSelectPart(int userId) async {
    if (await networkInfo.isConnected) {
      try {
        final result =
            await selectPartRemoteDatasourceImpl.getSelectPart(userId);
        return Right(result);
      } on ServerFailure {
        return const Left(ServerFailure("Маълумот юкланишда хатолик бўлди"));
      }
    } else {
      return const Left(
          NoConnectionFailure("Интернет билан алоқани қайта текширинг"));
    }
  }

  @override
  Future<Either<Failure, dynamic>> getSelectSubPart(String categoryId) async {
    if (await networkInfo.isConnected) {
      try {
        final result =
            await selectPartRemoteDatasourceImpl.getSelectSubPart(categoryId);
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
