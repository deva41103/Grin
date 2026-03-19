import '../models/user_model.dart';
import '../services/api_service.dart';

class UserRepository {
  final ApiService _apiService = ApiService();

  Future<Map<String, dynamic>> fetchUsers(int page, int perPage) async {
    final data = await _apiService.getUsers(page, perPage);
    final List<dynamic> usersJson = data['data'];
    final List<User> users = usersJson
        .map((json) => User.fromJson(json))
        .toList();

    return {'users': users, 'totalPages': data['total_pages']};
  }
}
