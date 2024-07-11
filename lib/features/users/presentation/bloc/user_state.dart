import 'package:equatable/equatable.dart';
import '../../domain/entity/user_list_model/datum.dart';

abstract class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoadingMore extends UserState {
  final List<UserData> users;

  UserLoadingMore({required this.users});

  @override
  List<Object> get props => [users];
}

class UserLoaded extends UserState {
  final List<UserData> users;

  UserLoaded({required this.users});

  @override
  List<Object> get props => [users];
}

class UserError extends UserState {
  final String message;

  UserError(this.message);

  @override
  List<Object> get props => [message];
}
