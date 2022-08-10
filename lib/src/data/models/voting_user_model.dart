import 'package:json_annotation/json_annotation.dart';
import 'package:vote_observers/src/domain/entities/voting_user.dart';

part 'voting_user_model.g.dart';

@JsonSerializable()
class VotingUserModel extends VotingUser {
  const VotingUserModel({
    required Map<String, dynamic> group,
    required Map<String, dynamic> state,
    required Map<String, dynamic> city,
    required Map<String, dynamic> place,
    required Map<String, dynamic> table,
    required String role,
    required String uid,
  }) : super(
    role: role,
    place: place,
    city: city,
    group: group,
    state: state,
    table: table,
    uid: uid,
  );

  factory VotingUserModel.fromJson(Map<String, dynamic> json) =>
      _$VotingUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$VotingUserModelToJson(this);
}