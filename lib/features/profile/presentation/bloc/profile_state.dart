part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final ProfModel object;

  ProfileSuccess({required this.object});
}

class ProfileFailure extends ProfileState {
  final String message;

  ProfileFailure({required this.message});
}
