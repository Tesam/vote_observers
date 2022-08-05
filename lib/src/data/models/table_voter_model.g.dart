// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_voter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TableVoterModel _$TableVoterModelFromJson(Map<String, dynamic> json) =>
    TableVoterModel(
      name: json['name'] as String,
      voted: json['voted'] as bool,
      voterId: json['voterId'] as String,
    );

Map<String, dynamic> _$TableVoterModelToJson(TableVoterModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'voted': instance.voted,
      'voterId': instance.voterId,
    };
