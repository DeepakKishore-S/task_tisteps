import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tisteps_task/core/router/routers.dart';
import 'features/users/data/data_source/user_impl_api.dart';
import 'features/users/data/repository/user_repo_impl.dart';
import 'features/users/domain/usecases/user_usecases.dart';
import 'features/users/presentation/bloc/user_bloc.dart';
import 'features/users/presentation/bloc/user_event.dart';
import 'features/users/presentation/pages/user_page.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final userRepository = UserRepositoryImpl(
      remoteDataSource: UserRemoteDataSourceImpl(
        client: http.Client(),
      ),
    );

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<UserBloc>(
            create: (context) => UserBloc(
              getUsersUseCase: GetUsersUseCase(userRepository),
            )..add(FetchUsers()),
          )
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const UserPage(),
          onGenerateRoute: AppRouter.generateRoute,
        ),
      ),
    );
  }
}
