import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vote_observers/src/domain/use_cases/authentication/get_user_by_id.dart';

final userStreamProvider = StreamProvider.autoDispose.family<dynamic, String>(
      (ref, uid) =>
      ref.read(getUserByIdProvider).getUserById(uid),
);