import 'package:vote_observers/src/domain/entities/voter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'table_voter_model.g.dart';

@JsonSerializable()
class TableVoterModel extends Voter {
  const TableVoterModel({
    required String name,
    required bool voted,
    required String voterId,
    required int order,
  }) : super(
          name: name,
          voted: voted,
          voterId: voterId,
          order: order,
        );

  factory TableVoterModel.fromJson(Map<String, dynamic> json) =>
      _$TableVoterModelFromJson(json);

  Map<String, dynamic> toJson() => _$TableVoterModelToJson(this);
}
