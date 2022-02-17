import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:etahlil/features/lock/domain/repositories/i_lock_repositories.dart';
import 'package:etahlil/features/navigation/navigation.dart';
import 'package:flutter/cupertino.dart';

part 'pass_event.dart';

part 'pass_state.dart';

class PassBloc extends Bloc<PassEvent, PassState> {
  final IPassRepository _passRepository;
  final BuildContext _context;

  PassBloc(
      {required IPassRepository passRepository, required BuildContext context})
      : _passRepository = passRepository,
        _context = context,
        super(const PassInitial("Махфий паролни киритинг")) {
    on<PassCompileEvent>(
      _nextPage,
      transformer: sequential(),
    );
  }

  FutureOr<void> _nextPage(
      PassCompileEvent event, Emitter<PassState> emit) async {
    emit(const PassLoading(""));
    if (event.passController.text == await _passRepository.setCompile()) {
      Navigator.push(
          _context,
          CupertinoPageRoute(
              builder: (context) => const BottomNavigationPage()));
      event.passController.clear();
    } else {
      emit(const PassError(
          message: "Киритилган пароль нотўғри илтимос қайтадан ҳаракат қилинг",
          errorMessage: "error"));
      event.passController.clear();
    }
  }
}
