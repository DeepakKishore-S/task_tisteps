import '../repository/abstract_user_repository.dart';

class GetUsersUseCase {
  final UserRepository userRepository;

  GetUsersUseCase(this.userRepository);

  Future<Map<String, dynamic>> call(int page) {
    return userRepository.getUsers(page);
  }
}
