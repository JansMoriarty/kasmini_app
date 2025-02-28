import 'package:equatable/equatable.dart';
import 'package:kasmini_app/domain/entities/kasir.dart';

enum DetailKasirStatus {
  initial,
  loading,
  loaded,
  updating,
  updated,
  error,
}

class DetailKasirState extends Equatable {
  final DetailKasirStatus status;
  final Kasir? kasirData;
  final String? errorMessage;

  const DetailKasirState({
    this.status = DetailKasirStatus.initial,
    this.kasirData,
    this.errorMessage,
  });

  DetailKasirState copyWith({
    DetailKasirStatus? status,
    Kasir? kasirData,
    String? errorMessage,
  }) {
    return DetailKasirState(
      status: status ?? this.status,
      kasirData: kasirData ?? this.kasirData,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, kasirData, errorMessage];
}