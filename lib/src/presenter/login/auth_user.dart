import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vote_observers/src/domain/use_cases/authentication/get_auth_state.dart';
import 'package:vote_observers/src/domain/use_cases/authentication/sign_in_with_email.dart';
import 'package:vote_observers/src/domain/use_cases/authentication/sign_out.dart';
import 'package:vote_observers/src/presenter/widgets/csm_snackbar.dart';

class AuthUser extends StateNotifier<User?> {
  AuthUser({
    required this.signInWithEmailUseCase,
    required this.signOutUseCase,
    required this.getAuthStateUseCase,
  }) : super(null);

  final SignInWithEmail signInWithEmailUseCase;
  final SignOut signOutUseCase;
  final GetAuthState getAuthStateUseCase;

  void signOut() => signOutUseCase.signOut();

  void signIn({required String email, required String password, context}) async {
    try{
      state = await signInWithEmailUseCase.signIn(
        email: email,
        password: password,
      );
    }on FirebaseAuthException catch(_){
      CSMSnackBar.error(context: context, text: "Correo o contraseña inválidos");
    }
  }
}

final authUserProvider = StateNotifierProvider<AuthUser, User?>((ref) {
  return AuthUser(
    getAuthStateUseCase: ref.read(getAuthStateProvider),
    signInWithEmailUseCase: ref.read(signInProvider),
    signOutUseCase: ref.read(signOutProvider),
  );
});
