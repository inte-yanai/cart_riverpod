import 'package:cart_riverpod/models/user.dart';
import 'package:cart_riverpod/services/auth_service.dart';

class AuthRepository {
  final _service = AuthService();

  Future<User?> signIn({required int id, required String pass}) async {
    return await _service.signIn(id: id, pass: pass);
  }
}
