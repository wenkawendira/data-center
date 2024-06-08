import 'package:freezed_annotation/freezed_annotation.dart';

part 'perawat.freezed.dart';

part 'perawat.g.dart';

@freezed
abstract class Perawat with _$Perawat {
  const factory Perawat({
    String? id,
    required String name,
    required int id_num,
    required String sex,
    required DateTime birthdate,
    required int age, 
    required String phone,
    required int nik,
    required int bpjs,
    required int satusehat,
    required String email,
    required String image,
  }) = _Perawat;

  factory Perawat.fromJson(Map<String, dynamic> json) => _$PerawatFromJson(json);
}