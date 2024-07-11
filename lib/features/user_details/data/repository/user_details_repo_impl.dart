import '../../domain/entity/user_details_model/data.dart';
import '../../domain/repository/user_repository.dart';
import '../data_source/user_details_remote_data_source.dart';

class UserDetailRepositoryImpl implements UserDetailsDataRepository {
  final UserRemoteDetailDataSource remoteDataSource;

  UserDetailRepositoryImpl({required this.remoteDataSource});

  @override
  Future<UserDetailsData> getUserDetails(int userId) async {
    try {
      final user = await remoteDataSource.getUserDetails(userId);

      if (user == null) {
        throw Exception('User details not found'); // Throw an exception for null data
      }

      return user;
    } catch (e) {
      throw Exception('Failed to fetch user details');
    }
  }
}

