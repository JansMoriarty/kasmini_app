import 'package:kasmini_app/domain/entities/kasir.dart';

enum KasirStatus { initial, loading, loaded, error }

class KasirState {
  final KasirStatus status;
  final List<Kasir> kasirData;
  final String? errorMessage;

  const KasirState({
    this.status = KasirStatus.initial,
    this.kasirData = const [],
    this.errorMessage,
  });

  KasirState copyWith({
    KasirStatus? status,
    List<Kasir>? kasirData,
    String? errorMessage,
  }) {
    return KasirState(
      status: status ?? this.status,
      kasirData: kasirData ?? this.kasirData,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
