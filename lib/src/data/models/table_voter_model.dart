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

  factory TableVoterModel.fromFirebase(String id, Map<String, Object?> doc) {
    return TableVoterModel(
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

  Map<String, dynamic> toJson() => _$TableVoterModelToJson(this);
}
