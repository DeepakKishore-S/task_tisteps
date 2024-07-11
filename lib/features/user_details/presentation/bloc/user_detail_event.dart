part of 'user_detail_bloc.dart';

@immutable
abstract class UserDetailEvent {}

class FetchUserDetails extends UserDetailEvent {
  final int userId;

  FetchUserDetails({required this.userId});
}
