import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vote_observers/src/core/enums.dart';

@JsonSerializable()
class Voter extends Equatable {
  final String name;
  final bool voted;
  @JsonKey(name: 'voter_id')
  final String voterId;
  final Map<String, dynamic>? state;
  final Map<String, dynamic>? city;
  final Map<String, dynamic>? place;
  final Map<String, dynamic>? table;
  final int order;
  @JsonKey(name: 'voted_list')
  final List<VoteInfo>? votedList;

  const Voter({
    required this.name,
    required this.voted,
    required this.voterId,
    this.state,
    this.city,
    this.place,
    this.votedList,
    this.table,
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
}

@JsonSerializable()
class VoteInfo extends Equatable {
  final String year;
  @JsonKey(name: 'voting_type')
  final VotingType votingType;
  @JsonKey(name: 'is_internal')
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