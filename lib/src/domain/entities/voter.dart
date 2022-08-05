import 'package:equatable/equatable.dart';
import 'package:vote_observers/src/core/enums.dart';

class Voter extends Equatable {
  final String name;
  final bool voted;
  final String voterId;
  final String state;
  final String city;
  final String place;
  final List<VoteInfo> votedList;

  const Voter({
    required this.name,
    required this.voted,
    required this.voterId,
    required this.state,
    required this.city,
    required this.place,
    required this.votedList,
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
      votedList
    ];
  }

  @override
  bool get stringify => true;
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