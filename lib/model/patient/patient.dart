import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient.freezed.dart';

part 'patient.g.dart';

@freezed
abstract class Patient with _$Patient {
  const factory Patient({
    String? id,
    required String name,
    required String phone,
    required String sex,
    required DateTime birthdate,
    required int age, 
    required int nik,
    required int bpjs,
    required int satusehat,
    required String image,
  }) = _Patient;

  factory Patient.fromJson(Map<String, dynamic> json) => _$PatientFromJson(json);
}
