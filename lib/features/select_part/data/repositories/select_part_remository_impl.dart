import 'package:dartz/dartz.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/network/network_info.dart';
import 'package:etahlil/features/select_part/data/datasoursec/select_part_local_datasources.dart';
import 'package:etahlil/features/select_part/data/datasoursec/select_part_remote_datasources.dart';
import 'package:etahlil/features/select_part/domain/repository/select_part_repository.dart';

class SelectPartRepositoryImpl extends SelectPartRepository {
  final SelectPartRemoteDatasourceImpl selectPartRemoteDatasourceImpl;
  final SelectPartLocalDatasource selectPartLocalDatasourceImpl;
  final NetworkInfo networkInfo;

  SelectPartRepositoryImpl(
      {required this.selectPartRemoteDatasourceImpl,
      required this.selectPartLocalDatasourceImpl,
      required this.networkInfo});

  @override
  Future<Either<Failure, dynamic>> getSelectPart(int userId) async {
    try {
      final result = await selectPartLocalDatasourceImpl.getSelectPart(userId);
      return Right(result);
    } on ServerFailure {
      return const Left(ServerFailure("Маълумот юкланишда хатолик бўлди"));
    }
  }

  @override
  Future<Either<Failure, dynamic>> getSelectSubPart(String categoryId) async {
    try {
      final result =
          await selectPartLocalDatasourceImpl.getSelectSubPart(categoryId);
      return Right(result);
    } on ServerFailure {
      return const Left(ServerFailure("Маълумот юкланишда хатолик бўлди"));
    }
  }
}
