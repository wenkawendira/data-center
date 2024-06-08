// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perawat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PerawatImpl _$$PerawatImplFromJson(Map<String, dynamic> json) =>
    _$PerawatImpl(
      id: json['id'] as String?,
      name: json['name'] as String,
      id_num: (json['id_num'] as num).toInt(),
      sex: json['sex'] as String,
      birthdate: DateTime.parse(json['birthdate'] as String),
      age: (json['age'] as num).toInt(),
      phone: json['phone'] as String,
      nik: (json['nik'] as num).toInt(),
      bpjs: (json['bpjs'] as num).toInt(),
      satusehat: (json['satusehat'] as num).toInt(),
      email: json['email'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$PerawatImplToJson(_$PerawatImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'id_num': instance.id_num,
      'sex': instance.sex,
      'birthdate': instance.birthdate.toIso8601String(),
      'age': instance.age,
      'phone': instance.phone,
      'nik': instance.nik,
      'bpjs': instance.bpjs,
      'satusehat': instance.satusehat,
      'email': instance.email,
      'image': instance.image,
    };
