import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vote_observers/src/data/repositories/auth_repository_impl.dart';
import 'package:vote_observers/src/domain/repositories/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryIml(FirebaseAuth.instance);
});
