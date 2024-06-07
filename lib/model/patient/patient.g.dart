// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatientImpl _$$PatientImplFromJson(Map<String, dynamic> json) =>
    _$PatientImpl(
      id: json['id'] as String?,
      name: json['name'] as String,
      phone: json['phone'] as String,
      sex: json['sex'] as String,
      birthdate: DateTime.parse(json['birthdate'] as String),
      age: (json['age'] as num).toInt(),
      nik: (json['nik'] as num).toInt(),
      bpjs: (json['bpjs'] as num).toInt(),
      satusehat: (json['satusehat'] as num).toInt(),
      image: json['image'] as String,
    );

Map<String, dynamic> _$$PatientImplToJson(_$PatientImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'sex': instance.sex,
      'birthdate': instance.birthdate.toIso8601String(),
      'age': instance.age,
      'nik': instance.nik,
      'bpjs': instance.bpjs,
      'satusehat': instance.satusehat,
      'image': instance.image,
    };
