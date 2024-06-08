import 'package:freezed_annotation/freezed_annotation.dart';

part 'status.freezed.dart';

part 'status.g.dart';

@freezed
abstract class Status with _$Status {
  const factory Status({
    String? id,
    required DateTime statusdate,
    required DateTime time,
    required String doctorname,
    required int weight,
    required int height, 
    required int bloodpres,  
    required int temp, 
    required String keluhan,
    required String keterangan,
    required String obat, 
    required DateTime appointment,
  }) = _Status;

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);
}