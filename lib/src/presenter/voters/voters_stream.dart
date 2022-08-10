import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/use_cases/voters/get_voters.dart';

final votersStream = StreamProvider.autoDispose.family<dynamic, String>(
  (ref, collectionName) =>
      ref.read(getVotersProvider).getVoters(collectionName: collectionName),
);
