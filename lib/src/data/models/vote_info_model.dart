import 'package:json_annotation/json_annotation.dart';
import 'package:vote_observers/src/core/enums.dart';
import 'package:vote_observers/src/domain/entities/voter.dart';

part 'vote_info_model.g.dart';

@JsonSerializable()
class VoteInfoModel extends VoteInfo {
  const VoteInfoModel({
    required String year,
    required VotingType votingType,
    required bool isInternal,
    required bool voted,
  }) : super(
    year: year,
    votingType: votingType,
    isInternal: isInternal,
    voted: voted,
  );

  factory VoteInfoModel.fromJson(Map<String, dynamic> json) =>
      _$VoteInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$VoteInfoModelToJson(this);
}