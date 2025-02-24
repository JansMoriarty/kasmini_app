import 'package:kasmini_app/domain/entities/cashflow.dart';

class CashflowModel extends Cashflow {
  CashflowModel({
    required super.id,
    required super.kasirId,
    required super.judul,
    required super.catatan,
    required super.nominal,
    required super.tanggal,
    required super.tipe,
  });

  factory CashflowModel.fromMap(Map<String, dynamic> map) {
    return CashflowModel(
      id: map['id'] as int,
      kasirId: map['kasirId'] as int,
      judul: map['judul'] as String,
      catatan: map['catatan'] as String,
      nominal: map['nominal'] as int,
      tanggal: DateTime.parse(map['tanggal']),
      tipe: CashflowType.values.byName(map['tipe']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'kasirId': kasirId,
      'judul': judul,
      'catatan': catatan,
      'nominal': nominal,
      'tanggal': tanggal.toIso8601String(),
      'tipe': tipe.toString(),
    };
  }
}
