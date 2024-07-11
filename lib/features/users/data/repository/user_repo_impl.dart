import '../../domain/repository/abstract_user_repository.dart';
import '../data_source/user_impl_api.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Map<String, dynamic>> getUsers(int page) async {
    return await remoteDataSource.getUsers(page);
  }
}
