// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StatusImpl _$$StatusImplFromJson(Map<String, dynamic> json) => _$StatusImpl(
      id: json['id'] as String?,
      statusdate: DateTime.parse(json['statusdate'] as String),
      time: DateTime.parse(json['time'] as String),
      doctorname: json['doctorname'] as String,
      weight: (json['weight'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      bloodpres: (json['bloodpres'] as num).toInt(),
      temp: (json['temp'] as num).toInt(),
      keluhan: json['keluhan'] as String,
      keterangan: json['keterangan'] as String,
      obat: json['obat'] as String,
      appointment: DateTime.parse(json['appointment'] as String),
    );

Map<String, dynamic> _$$StatusImplToJson(_$StatusImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusdate': instance.statusdate.toIso8601String(),
      'time': instance.time.toIso8601String(),
      'doctorname': instance.doctorname,
      'weight': instance.weight,
      'height': instance.height,
      'bloodpres': instance.bloodpres,
      'temp': instance.temp,
      'keluhan': instance.keluhan,
      'keterangan': instance.keterangan,
      'obat': instance.obat,
      'appointment': instance.appointment.toIso8601String(),
    };
