import 'dart:io';

import 'package:cart_riverpod/models/user.dart';
import 'package:dio/dio.dart';

class AuthService {
  Future<User?> signIn({required int id, required String pass}) async {
    final dio = Dio();
    final response = await dio.post('');
    if (response.statusCode == HttpStatus.ok) {
      final json = response.data as Map<String, dynamic>;
      if (!json.containsKey('error')) {
        return User.fromJson(json);
      }
    }

    return null;
  }
}
