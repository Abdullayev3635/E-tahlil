import 'package:dartz/dartz.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/network/network_info.dart';
import 'package:etahlil/features/old_history/data/datasoursec/old_history_remote_datasources.dart';
import 'package:etahlil/features/old_history/data/models/old_history_model.dart';
import 'package:etahlil/features/old_history/domain/repository/old_history_repository.dart';

class OldHistoryRepositoryImpl extends OldHistoryRepository {
  final OldHistoryRemoteDatasourceImpl oldHistoryRemoteDatasourceImpl;
  final NetworkInfo networkInfo;

  OldHistoryRepositoryImpl(
      {required this.oldHistoryRemoteDatasourceImpl,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<OldHistoryModel>>> getOldHistory(
      int userId) async {
    if (await networkInfo.isConnected) {
      try {
        final result =
            await oldHistoryRemoteDatasourceImpl.getOldHistory(userId);
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
