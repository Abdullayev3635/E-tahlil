import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/usescases/usecase.dart';
import 'package:etahlil/features/profile/data/repositories/profile_repository_impl.dart';

class ProfData extends UseCase<dynamic, ProfParams> {
  final ProfRepositoryImpl profRepository;

  ProfData({required this.profRepository});

  @override
  Future<Either<Failure, dynamic>> call(ProfParams params) {
    return profRepository.getProf(params.userId);
  }
}

class ProfParams extends Equatable {
  final String userId;

  @override
  List<Object?> get props => [userId];

  const ProfParams(this.userId);
}
