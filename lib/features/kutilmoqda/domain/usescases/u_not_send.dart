import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/usescases/usecase.dart';
import 'package:etahlil/features/send_data/data/models/img_model.dart';
import 'package:etahlil/features/send_data/domain/repository/send_data_repository.dart';

import '../../data/model/not_send_model.dart';
import '../repository/yuborilmagan_repository.dart';

class NotSend extends UseCase<dynamic, NotSendParams> {
  final NotSendRepository notSendRepository;

  NotSend({required this.notSendRepository});

  @override
  Future<Either<Failure, dynamic>> call(NotSendParams params) {
    return notSendRepository.setNotSends(params.notSendModel);
  }
}

class NotSendParams extends Equatable {
  final NotSendModel notSendModel;

  @override
  List<Object?> get props => [notSendModel];

  const NotSendParams(this.notSendModel);
}
