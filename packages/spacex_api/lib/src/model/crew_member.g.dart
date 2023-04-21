// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crew_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CrewMember _$CrewMemberFromJson(Map<String, dynamic> json) => $checkedCreate(
      'CrewMember',
      json,
      ($checkedConvert) {
        final val = CrewMember(
          id: $checkedConvert('id', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          status: $checkedConvert('status', (v) => v as String),
          agency: $checkedConvert('agency', (v) => v as String),
          image: $checkedConvert('image', (v) => v as String),
          wikipedia: $checkedConvert('wikipedia', (v) => v as String),
          launches: $checkedConvert('launches',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$CrewMemberToJson(CrewMember instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'agency': instance.agency,
      'image': instance.image,
      'wikipedia': instance.wikipedia,
      'launches': instance.launches,
    };
