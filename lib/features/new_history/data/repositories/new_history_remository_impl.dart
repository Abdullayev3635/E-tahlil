import 'package:dartz/dartz.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/network/network_info.dart';
import 'package:etahlil/features/new_history/data/datasoursec/new_history_remote_datasources.dart';
import 'package:etahlil/features/new_history/data/models/new_history_model.dart';
import 'package:etahlil/features/new_history/domain/repository/new_history_repository.dart';

class NewHistoryRepositoryImpl extends NewHistoryRepository {
  final NewHistoryRemoteDatasourceImpl newHistoryRemoteDatasourceImpl;
  final NetworkInfo networkInfo;

  NewHistoryRepositoryImpl(
      {required this.newHistoryRemoteDatasourceImpl,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<NewHistoryModel>>> getNewHistory(
      int userId) async {
    if (await networkInfo.isConnected) {
      try {
        final result =
            await newHistoryRemoteDatasourceImpl.getNewHistory(userId);
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
