import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../repositories/user_repository.dart';

class UserController extends ChangeNotifier {
  final UserRepository _userRepository = UserRepository();

  List<User> _users = [];
  bool _isLoading = false;
  int _currentPage = 1;
  int _totalPages = 1;

  List<User> get users => _users;
  bool get isLoading => _isLoading;
  bool get hasMore => _currentPage <= _totalPages;

  Future<void> fetchUsers({bool refresh = false}) async {
    if (refresh) {
      _currentPage = 1;
      _users = [];
    }

    if (_isLoading) return;

    _isLoading = true;
    notifyListeners();

    try {
      final result = await _userRepository.fetchUsers(_currentPage, 8);
      _users.addAll(result['users'] as List<User>);
      _totalPages = result['totalPages'];
      _currentPage++;
    } catch (e) {
      debugPrint('Error fetching users: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
