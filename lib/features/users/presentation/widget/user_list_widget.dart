import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/user_bloc.dart';
import '../bloc/user_event.dart';
import '../bloc/user_state.dart';

import '../widget/user_card_widget.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels != 0) {
        final userBloc = BlocProvider.of<UserBloc>(context);
        if (!userBloc.isFetching && !userBloc.hasReachedMax) {
          userBloc.add(FetchUsers());
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoading && state is! UserLoadingMore) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserLoaded || state is UserLoadingMore) {
          final users = state is UserLoaded
              ? state.users
              : (state as UserLoadingMore).users;

          return ListView.builder(
            controller: _scrollController,
            itemCount: users.length + 1,
            itemBuilder: (context, index) {
              if (index == users.length) {
                if (state is UserLoadingMore) {
                  return const Center(child: CircularProgressIndicator());
                } else if ((context.read<UserBloc>().hasReachedMax)) {
                  return const Center(child: Text('No more users to load'));
                } else {
                  return const SizedBox.shrink();
                }
              }
              return UserCard(
                user: users[index],
                index: index,
              );
            },
          );
        } else if (state is UserError) {
          return Center(child: Text(state.message));
        }
        return const Center(
            child: Text('Something went wrong, Try again later'));
      },
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }
}
