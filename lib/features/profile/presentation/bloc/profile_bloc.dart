import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/features/profile/data/models/prof_model.dart';
import 'package:etahlil/features/profile/domain/usescases/u_profile.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfData profData;

  ProfileBloc({
    required this.profData,
  }) : super(ProfileInitial()) {
    on<GetDataProfile>(getProf, transformer: sequential());
  }

  FutureOr<void> getProf(
      GetDataProfile event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    final result = await profData(
      const ProfParams("2"),
    );
    result.fold(
        (failure) => {
              if (failure is NoConnectionFailure)
                {emit(ProfileNoConnection())}
              else if (failure is ServerFailure)
                {emit(ProfileFailure(message: failure.message))}
            },
        (r) => {emit(ProfileSuccess(object: r))});
  }
}
