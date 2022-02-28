import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/usescases/usecase.dart';
import 'package:etahlil/features/lock/domain/repositories/lock_repositories.dart';

class Pass extends UseCase<bool, PasswordParams> {
  final PassRepository repository;

  Pass({required this.repository});

  @override
  Future<Either<Failure, bool>> call(PasswordParams params) {
    return repository.setCompile(params.oldPassword);
  }
}

class PasswordParams extends Equatable {
  final String oldPassword;

  const PasswordParams(this.oldPassword);

  @override
  List<Object?> get props => [oldPassword];
}
