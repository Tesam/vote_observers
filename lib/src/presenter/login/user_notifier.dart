import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vote_observers/presenter/home.dart';
import 'package:vote_observers/src/data/repositories/auth_repository_impl.dart';
import 'package:vote_observers/src/domain/repositories/auth_repository.dart';
import 'package:vote_observers/src/presenter/widgets/csm_snackbar.dart';

class UserNotifier extends StateNotifier<bool> {
  final AuthRepository authRepository;

  UserNotifier({required this.authRepository}) : super(false);

  Future<void> signInWithEmailAndPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await authRepository.signInWithEmail(email: email, password: password);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Home()));
    } on FirebaseAuthException catch (_) {
      CSMSnackBar.error(context: context, text: "Correo o contraseña inválidos");
   //   ScaffoldMessenger.of(context).showSnackBar();
    }
  }
}

final loggedProvider = StateNotifierProvider<UserNotifier, bool>((ref) {
  return UserNotifier(authRepository: ref.read(authRepositoryProvider));
});

final authRepositoryProvider = Provider<AuthRepositoryIml>((ref) {
  return AuthRepositoryIml(FirebaseAuth.instance);
});
