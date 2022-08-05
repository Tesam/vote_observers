import 'package:vote_observers/src/domain/entities/voter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'table_voter_model.g.dart';

@JsonSerializable()
class TableVoterModel extends Voter {
  const TableVoterModel({
    required String name,
    required bool voted,
    required String voterId,
  }) : super(
          name: name,
          voted: voted,
          voterId: voterId,
        );

  factory TableVoterModel.fromJson(Map<String, dynamic> json) => _$TableVoterModelFromJson(json);

  Map<String, dynamic> toJson() => _$TableVoterModelToJson(this);
}
