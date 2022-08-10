// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voting_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VotingUserModel _$VotingUserModelFromJson(Map<String, dynamic> json) =>
    VotingUserModel(
      group: json['group'] as Map<String, dynamic>,
      state: json['state'] as Map<String, dynamic>,
      city: json['city'] as Map<String, dynamic>,
      place: json['place'] as Map<String, dynamic>,
      table: json['table'] as Map<String, dynamic>,
      role: json['role'] as String,
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$VotingUserModelToJson(VotingUserModel instance) =>
    <String, dynamic>{
      'group': instance.group,
      'state': instance.state,
      'city': instance.city,
      'place': instance.place,
      'table': instance.table,
      'role': instance.role,
      'uid': instance.uid,
    };
