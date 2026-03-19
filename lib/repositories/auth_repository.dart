import 'package:firebase_auth/firebase_auth.dart' as fb;
import '../services/auth_service.dart';

class AuthRepository {
  final AuthService _authService = AuthService();

  Stream<fb.User?> get user => _authService.user;

  Future<fb.UserCredential> signUp(String email, String password) {
    return _authService.signUp(email, password);
  }

  Future<fb.UserCredential> login(String email, String password) {
    return _authService.login(email, password);
  }

  Future<void> logout() {
    return _authService.logout();
  }
}
