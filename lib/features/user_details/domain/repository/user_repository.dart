import '../entity/user_details_model/data.dart';

abstract class UserDetailsDataRepository {
  Future<UserDetailsData> getUserDetails(int userId);
}