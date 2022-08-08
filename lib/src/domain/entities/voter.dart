import 'package:equatable/equatable.dart';
import 'package:vote_observers/src/core/enums.dart';

class Voter extends Equatable {
  final String name;
  final bool voted;
  final String voterId;
  final String? state;
  final String? city;
  final String? place;
  final int order;
  final List<VoteInfo>? votedList;

  const Voter({
    required this.name,
    required this.voted,
    required this.voterId,
    this.state,
    this.city,
    this.place,
    this.votedList,
    required this.order,
  });

  @override
  List<Object?> get props {
    return [
      name,
      voted,
      voterId,
      state,
      city,
      place,
      votedList,
      order,
    ];
  }

  @override
  bool get stringify => true;

  factory Voter.fromFirebase(String id, Map<String, Object?> doc) {
    return Voter(
      name: doc['name'] as String,
      order: doc['order'] as int,
      voted: doc['voted'] as bool,
      voterId: doc['voter_id'] as String,
    );
  }

  Map<String, Object?> toFirebase() {
    return {
      'name': name,
      'order': order,
      'voted': voted,
      'voter_id': voterId,
    };
  }
}

class VoteInfo extends Equatable {
  final String year;
  final VotingType votingType;
  final bool isInternal;
  final bool voted;

  const VoteInfo({
    required this.year,
    required this.votingType,
    required this.isInternal,
    required this.voted,
  });

  @override
  List<Object?> get props {
    return [
      year,
      votingType,
      isInternal,
      voted,
    ];
  }

  @override
  bool get stringify => true;
}