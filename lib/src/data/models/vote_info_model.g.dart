// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoteInfoModel _$VoteInfoModelFromJson(Map<String, dynamic> json) =>
    VoteInfoModel(
      year: json['year'] as String,
      votingType: $enumDecode(_$VotingTypeEnumMap, json['voting_type']),
      isInternal: json['is_internal'] as bool,
      voted: json['voted'] as bool,
    );

Map<String, dynamic> _$VoteInfoModelToJson(VoteInfoModel instance) =>
    <String, dynamic>{
      'year': instance.year,
      'voting_type': _$VotingTypeEnumMap[instance.votingType]!,
      'is_internal': instance.isInternal,
      'voted': instance.voted,
    };

const _$VotingTypeEnumMap = {
  VotingType.generales: 'generales',
  VotingType.municipales: 'municipales',
};
