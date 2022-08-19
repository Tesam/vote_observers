// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'padron_voter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PadronVoterModel _$PadronVoterModelFromJson(Map<String, dynamic> json) =>
    PadronVoterModel(
      name: json['name'] as String,
      voted: json['voted'] as bool,
      voterId: json['voter_id'] as String,
      state: json['state'] as Map<String, dynamic>,
      city: json['city'] as Map<String, dynamic>,
      place: json['place'] as Map<String, dynamic>,
      votedList: (json['voted_list'] as List<dynamic>)
          .map((e) => VoteInfoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      table: json['table'] as Map<String, dynamic>,
      order: json['order'] as int,
    );

Map<String, dynamic> _$PadronVoterModelToJson(PadronVoterModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'voted': instance.voted,
      'voter_id': instance.voterId,
      'state': instance.state,
      'city': instance.city,
      'place': instance.place,
      'table': instance.table,
      'order': instance.order,
      'voted_list': instance.votedList,
    };
