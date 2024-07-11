part of 'user_detail_bloc.dart';

@immutable
abstract class UserDetailState {}

class UserDetailInitial extends UserDetailState {}

class UserDetailLoading extends UserDetailState {}

class UserDetailLoaded extends UserDetailState {
  final UserDetailsData user;

  UserDetailLoaded({required this.user});
}

class UserDetailError extends UserDetailState {
  final String message;

  UserDetailError({required this.message});
}
