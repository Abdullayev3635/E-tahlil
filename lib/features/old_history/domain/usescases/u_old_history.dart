import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/usescases/usecase.dart';
import 'package:etahlil/features/old_history/data/models/old_history_model.dart';
import 'package:etahlil/features/old_history/domain/repository/old_history_repository.dart';

class UOldHistory extends UseCase<List<OldHistoryModel>, NewHistoryParams> {
  final OldHistoryRepository oldHistoryRepo;

  UOldHistory({required this.oldHistoryRepo});

  @override
  Future<Either<Failure, List<OldHistoryModel>>> call(NewHistoryParams params) {
    return oldHistoryRepo.getOldHistory(params.userId);
  }
}

class NewHistoryParams extends Equatable {
  final int userId;

  const NewHistoryParams({required this.userId});

  @override
  List<Object?> get props => [userId];
}
