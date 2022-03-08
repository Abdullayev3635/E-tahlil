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
    return oldHistoryRepo.getOldHistory(params.categoryId, params.subCategoryId,
        params.startDate, params.endDate);
  }
}

class NewHistoryParams extends Equatable {
  final int categoryId;
  final int subCategoryId;
  final String startDate;
  final String endDate;

  const NewHistoryParams(
      {required this.categoryId,
      required this.subCategoryId,
      required this.startDate,
      required this.endDate});

  @override
  List<Object?> get props => [categoryId, subCategoryId, startDate, endDate];
}
