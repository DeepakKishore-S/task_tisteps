import '../entity/user_details_model/data.dart';
import '../repository/user_repository.dart';

class GetUserDetailsUseCase {
  final UserDetailsDataRepository userRepository;

  GetUserDetailsUseCase({required this.userRepository});

  Future<UserDetailsData> call(int userId) async {
    return await userRepository.getUserDetails(userId);
  }
}
