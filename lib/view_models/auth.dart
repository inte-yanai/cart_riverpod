import 'package:cart_riverpod/models/user.dart';
import 'package:cart_riverpod/view_models/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth.g.dart';

@riverpod
class Auth extends _$Auth {
  @override
  User? build() => null;

  //サインイン
  Future<void> signIn({required int id, required String pass}) async {
    final authRepository = ref.read(authRepositoryProvider);
    state = await authRepository.signIn(id: id, pass: pass);
  }

  //サインアウト
  signOut() {
    state = null;
  }
}
