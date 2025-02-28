import 'package:equatable/equatable.dart';
import 'package:kasmini_app/domain/entities/kasir.dart';

enum StatusKasir {
  initial,
  loading,
  loaded,
  error,
}

class ListKasirState extends Equatable {
  final StatusKasir status;
  final List<Kasir> kasirData;
  final String? errorMessage;

  const ListKasirState({
    this.status = StatusKasir.initial,
    this.kasirData = const [],
    this.errorMessage,
  });

  ListKasirState copyWith({
    StatusKasir? status,
    List<Kasir>? kasirData,
    String? errorMessage,
  }) {
    return ListKasirState(
      status: status ?? this.status,
      kasirData: kasirData ?? this.kasirData,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, kasirData, errorMessage];
}