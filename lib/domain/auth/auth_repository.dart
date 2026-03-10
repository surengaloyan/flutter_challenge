abstract class AuthRepository {
  Future<bool> logout();
  Future<String?> getActiveUsername();
  Future<bool> login({required String username, required String password});
  Future<bool> signup({
    required String email,
    required String username,
    required String password,
  });
}
