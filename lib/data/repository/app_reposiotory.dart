import '../entities/login_response.dart';

abstract class AppRepository {
  Future<User?> getProfile();
  Future<LoginResponse?> login({String? email, String? password});
  Future<String?> deleteAccount();
}
