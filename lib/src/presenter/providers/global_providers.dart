import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vote_observers/src/data/datasources/remote/auth_service.dart';
import 'package:vote_observers/src/data/datasources/remote/voters_service.dart';
import 'package:vote_observers/src/data/repositories/auth_repository_impl.dart';
import 'package:vote_observers/src/data/repositories/voters_repository_impl.dart';
import 'package:vote_observers/src/domain/repositories/auth_repository.dart';
import 'package:vote_observers/src/domain/repositories/voters_repository.dart';

//Inject repositories implementations
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryIml(ref.read(authServiceProvider));
});

final votersRepositoryProvider = Provider<VotersRepository>((ref) {
  return VotersRepositoryImpl(ref.read(votersServiceProvider));
});

//Firebase
final firebaseFirestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);
