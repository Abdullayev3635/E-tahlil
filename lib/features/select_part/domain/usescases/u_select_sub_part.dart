import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/usescases/usecase.dart';
import 'package:etahlil/features/select_part/domain/repository/select_part_repository.dart';

class USelectSubPart extends UseCase<dynamic, SelectSubPartParams> {
  final SelectPartRepository selectPartRepo;

  USelectSubPart({required this.selectPartRepo});

  @override
  Future<Either<Failure, dynamic>> call(SelectSubPartParams params) {
    return selectPartRepo.getSelectSubPart(params.categoryId);
  }
}

class SelectSubPartParams extends Equatable {
  final String categoryId;

  const SelectSubPartParams({required this.categoryId});

  @override
  List<Object?> get props => [categoryId];
}
