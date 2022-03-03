import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/usescases/usecase.dart';
import 'package:etahlil/features/new_history/data/models/new_history_model.dart';
import 'package:etahlil/features/new_history/domain/repository/new_history_repository.dart';

class UNewHistory extends UseCase<List<NewHistoryModel>, NewHistoryParams> {
  final NewHistoryRepository newHistoryRepo;

  UNewHistory({required this.newHistoryRepo});

  @override
  Future<Either<Failure, List<NewHistoryModel>>> call(NewHistoryParams params) {
    return newHistoryRepo.getNewHistory(params.userId);
  }
}

class NewHistoryParams extends Equatable {
  final int userId;

  const NewHistoryParams({required this.userId});

  @override
  List<Object?> get props => [userId];
}
