import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/styles/app_text_style.dart';
import '../../data/data_source/user_details_remote_data_source.dart';
import '../../data/repository/user_details_repo_impl.dart';
import '../../domain/usecases/get_user_details_usecase.dart';
import '../bloc/user_detail_bloc.dart';
import 'package:http/http.dart' as http;

import 'widget/user_details_view.dart';

class UserDetailScreen extends StatelessWidget {
  final int userId;
  final int index;

  const UserDetailScreen(
      {super.key, required this.userId, required this.index});

  @override
  Widget build(BuildContext context) {
    final userDetailRepository = UserDetailRepositoryImpl(
        remoteDataSource: UserRemoteDetailDataSource(client: http.Client()));
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('User Details', style: AppTextStyle.xxxLargeBlackBold),
      ),
      body: BlocProvider(
        create: (context) => UserDetailBloc(
            getUserDetailsUseCase:
                GetUserDetailsUseCase(userRepository: userDetailRepository))
          ..add(FetchUserDetails(userId: userId)),
        child: UserDetailView(
          index: index,
        ),
      ),
    );
  }
}
