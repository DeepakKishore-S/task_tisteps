import 'package:http/http.dart' as http;
import 'package:tisteps_task/features/user_details/domain/entity/user_details_model/user_details_model.dart';

import '../../domain/entity/user_details_model/data.dart';

class UserRemoteDetailDataSource {
  final http.Client client;

  UserRemoteDetailDataSource({required this.client});

  Future<UserDetailsData> getUserDetails(int userId) async {
    final response =
        await client.get(Uri.parse('https://reqres.in/api/users/$userId'));

    if (response.statusCode == 200) {
      UserDetailsModel userDetailData =
          UserDetailsModel.fromJson(response.body);
          if (userDetailData.data == null) {
        throw Exception('User details not found'); // Throw an exception for null data
      }
      return userDetailData.data!;
      
    } else {
      throw Exception('Failed to fetch user details');
    }
  }
}
