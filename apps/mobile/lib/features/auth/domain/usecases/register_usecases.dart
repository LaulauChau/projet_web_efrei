// register_usecase.dart
import 'package:projet_web_flutter/features/auth/domain/repository/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository _authRepository;

  RegisterUseCase(this._authRepository);

  Future<void> execute(String name, String email, String password) async {
    await _authRepository.signUpWithEmailPassword(email, password);
    print("registering");
  }
}