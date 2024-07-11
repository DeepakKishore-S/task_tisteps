abstract class UserRepository {
  Future<Map<String, dynamic>> getUsers(int page);
}
