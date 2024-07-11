import 'package:http/http.dart' as http;

import '../../domain/entity/user_list_model/datum.dart';
import '../../domain/entity/user_list_model/user_list_model.dart';

abstract class UserRemoteDataSource {
  Future<Map<String, dynamic>> getUsers(int page);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<Map<String, dynamic>> getUsers(int page) async {
    final response =
        await client.get(Uri.parse('https://reqres.in/api/users?page=$page'));
    if (response.statusCode == 200) {
      UserListModel? responseData = UserListModel.fromJson(response.body);
      List<UserData>? users = responseData.data;
      return {
        'data': users,
        'total_pages': responseData.totalPages,
      };
    } else {
      throw Exception('Failed to load users');
    }
  }
}
