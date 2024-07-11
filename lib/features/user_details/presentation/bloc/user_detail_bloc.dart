import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tisteps_task/features/user_details/domain/entity/user_details_model/data.dart';
import '../../domain/usecases/get_user_details_usecase.dart';

part 'user_detail_event.dart';
part 'user_detail_state.dart';

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  final GetUserDetailsUseCase getUserDetailsUseCase;

  UserDetailBloc({required this.getUserDetailsUseCase}) : super(UserDetailInitial()) {
    on<FetchUserDetails>(_onFetchUserDetails);
  }

  Future<void> _onFetchUserDetails(FetchUserDetails event, Emitter<UserDetailState> emit) async {
    emit(UserDetailLoading());
    try {
        final user = await getUserDetailsUseCase(event.userId);
        emit(UserDetailLoaded(user: user));
    } catch (e) {
      emit(UserDetailError(message: e.toString()));
    }
  }
}
