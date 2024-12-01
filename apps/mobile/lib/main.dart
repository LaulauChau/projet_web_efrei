import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projet_web_flutter/features/auth/data/repository/auth_repository_firebase_impl.dart';
import 'package:projet_web_flutter/features/auth/domain/repository/auth_repository.dart';
import 'package:projet_web_flutter/features/auth/domain/usecases/login_usecase.dart';
import 'package:projet_web_flutter/features/auth/domain/usecases/register_usecases.dart';
import 'package:projet_web_flutter/features/auth/presentation/pages/login_page.dart';
import 'package:projet_web_flutter/features/auth/presentation/pages/register_page.dart';
import 'package:projet_web_flutter/features/auth/presentation/viewmodels/login_viewmodel.dart';
import 'package:projet_web_flutter/features/auth/presentation/viewmodels/register_viewmodel.dart';
import 'package:projet_web_flutter/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final authRepository = AuthRepositoryFirebaseImpl();

  runApp(
    MultiProvider(
      providers: [
        // AuthRepository
        Provider<AuthRepository>.value(value: authRepository),

        // LoginUseCase
        Provider<LoginUseCase>(
          create: (context) => LoginUseCase(context.read<AuthRepository>()),
        ),

        // LoginViewModel
        ChangeNotifierProvider<LoginViewModel>(
          create: (context) => LoginViewModel(context.read<LoginUseCase>()),
        ),

        // RegisterUseCase
        Provider<RegisterUseCase>(
          create: (context) => RegisterUseCase(context.read<AuthRepository>()),
        ),

        // RegisterViewModel
        ChangeNotifierProvider<RegisterViewModel>(
          create: (context) => RegisterViewModel(context.read<RegisterUseCase>()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const LoginPage(),
      routes: {
        '/login': (_) => const LoginPage(),
        '/register': (_) => const RegisterPage(),
        // Replace with actual recipe page
      },
    );
  }
}