import 'package:equatable/equatable.dart';
import 'package:kasmini_app/domain/entities/kasir.dart';

enum StatusKasir {
  initial,
  loading,
  loaded,
  error,
  updating,
  updated,
}

class KasirState extends Equatable {
  final StatusKasir status;
  final List<Kasir> kasirData;
  final String? errorMessage;

  const KasirState({
    this.status = StatusKasir.initial,
    this.kasirData = const [],
    this.errorMessage,
  });

  KasirState copyWith({
    StatusKasir? status,
    List<Kasir>? kasirData,
    String? errorMessage,
  }) {
    return KasirState(
      status: status ?? this.status,
      kasirData: kasirData ?? this.kasirData,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, kasirData, errorMessage];
}
