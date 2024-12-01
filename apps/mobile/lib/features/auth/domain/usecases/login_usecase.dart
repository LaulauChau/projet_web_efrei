import 'package:projet_web_flutter/features/auth/domain/repository/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  Future<void> execute(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      throw Exception('Email and password are required.');
    }
    return await _repository.signInWithEmailPassword(email, password);
  }
}
