import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entity/user_list_model/datum.dart';
import '../../domain/usecases/user_usecases.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsersUseCase getUsersUseCase;
  int currentPage = 1;
  bool isFetching = false;
  bool hasReachedMax = false;
  List<UserData> userData = [];

  UserBloc({required this.getUsersUseCase}) : super(UserInitial()) {
    on<FetchUsers>((event, emit) async {
      if (hasReachedMax) return;

      if (state is UserLoaded) {
        final currentState = state as UserLoaded;
        emit(UserLoadingMore(users: currentState.users));
      } else {
        emit(UserLoading());
      }

      try {
        isFetching = true;
        final response = await getUsersUseCase(currentPage);
        final users = response['data'] as List<UserData>;
        final totalPages = response['total_pages'];

        if (currentPage >= totalPages) {
          hasReachedMax = true;
        }

        currentPage++;
        isFetching = false;
        userData.addAll(users);
        emit(UserLoaded(users: userData));
      } catch (e) {
        isFetching = false;
        emit(UserError(e.toString()));
      }
    });
  }
}
