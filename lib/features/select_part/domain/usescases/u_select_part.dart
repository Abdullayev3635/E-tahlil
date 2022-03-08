import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/usescases/usecase.dart';
import 'package:etahlil/features/select_part/domain/repository/select_part_repository.dart';

class USelectPart extends UseCase<dynamic, SelectPartParams> {
  final SelectPartRepository selectPartRepo;

  USelectPart({required this.selectPartRepo});

  @override
  Future<Either<Failure, dynamic>> call(SelectPartParams params) {
    return selectPartRepo.getSelectPart(params.userId);
  }
}

class SelectPartParams extends Equatable {
  final int userId;

  const SelectPartParams({required this.userId});

  @override
  List<Object?> get props => [userId];
}
