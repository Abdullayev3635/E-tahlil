import 'package:dartz/dartz.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/network/network_info.dart';
import 'package:etahlil/features/profile/data/datasources/profile_local_datasources.dart';
import 'package:etahlil/features/profile/data/datasources/profile_remote_datasources.dart';
import 'package:etahlil/features/profile/domain/repositories/profile_repository.dart';

class ProfRepositoryImpl extends ProfRepository {
  final ProfRemoteDatasourceImpl profRemoteDatasource;
  final ProfileLocalDataSourcesImpl profLocalDatasource;
  final NetworkInfo networkInfo;

  ProfRepositoryImpl(
      {required this.profRemoteDatasource,
      required this.profLocalDatasource,
      required this.networkInfo});

  @override
  Future<Either<Failure, dynamic>> getProf(String userId) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await profRemoteDatasource.setData(userId);
        profLocalDatasource.setProf(result);
        return Right(result);
      } on ServerFailure {
        return const Left(ServerFailure("Маълумот юкланишда хатолик бўлди"));
      }
    } else {
      try {
        final result = await profLocalDatasource.getProf();
        return Right(result);
      } on LocalFailure {
        return const Left(ServerFailure("Маълумот юкланишда хатолик бўлди"));
      }
    }
  }
}
