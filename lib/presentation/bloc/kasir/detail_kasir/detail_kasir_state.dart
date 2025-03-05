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
  final String? avatarImagePath;
  final bool isImageUpdated;
  final String? errorMessage;

  const DetailKasirState({
    this.status = DetailKasirStatus.initial,
    this.kasirData,
    this.avatarImagePath,
    this.isImageUpdated = false,
    this.errorMessage,
  });

  DetailKasirState copyWith({
    DetailKasirStatus? status,
    Kasir? kasirData,
    String? avatarImagePath,
    bool? isImageUpdated,
    String? errorMessage,
  }) {
    return DetailKasirState(
      status: status ?? this.status,
      kasirData: kasirData ?? this.kasirData,
      avatarImagePath: avatarImagePath ?? this.avatarImagePath,
      isImageUpdated: isImageUpdated ?? this.isImageUpdated,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, kasirData, avatarImagePath, isImageUpdated, errorMessage];
}