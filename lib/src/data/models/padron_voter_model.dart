import 'package:json_annotation/json_annotation.dart';
import 'package:vote_observers/src/data/models/vote_info_model.dart';
import 'package:vote_observers/src/domain/entities/voter.dart';

part 'padron_voter_model.g.dart';

@JsonSerializable()
class PadronVoterModel extends Voter {
  const PadronVoterModel({
    required String name,
    required bool voted,
    required String voterId,
    required Map<String, dynamic> state,
    required Map<String, dynamic> city,
    required Map<String, dynamic> place,
    required List<VoteInfoModel> votedList,
    required Map<String, dynamic> table,
    required int order,
  }) : super(
    name: name,
    voted: voted,
    voterId: voterId,
    state: state,
    city: city,
    place: place,
    votedList: votedList,
    table: table,
    order: order,
  );

  factory PadronVoterModel.fromJson(Map<String, dynamic> json) =>
      _$PadronVoterModelFromJson(json);

  Map<String, dynamic> toJson() => _$PadronVoterModelToJson(this);
}