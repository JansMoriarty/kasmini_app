import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasmini_app/data/models/kasir_model.dart';
import 'package:kasmini_app/domain/entities/kasir.dart';
import 'package:kasmini_app/domain/repositories/kasir_repo.dart';
import 'package:kasmini_app/presentation/bloc/kasir/detail_kasir/detail_kasir_event.dart';
import 'package:kasmini_app/presentation/bloc/kasir/detail_kasir/detail_kasir_state.dart';

class DetailKasirBloc extends Bloc<DetailKasirEvent, DetailKasirState> {
  final KasirRepo _kasirRepo;

  DetailKasirBloc(this._kasirRepo) : super(const DetailKasirState()) {
    on<LoadKasirById>((event, emit) async {
      emit(state.copyWith(status: DetailKasirStatus.loading));

      try {
        final Kasir? kasirData = await _kasirRepo.getKasir({'id': event.id});

        if (kasirData == null) {
          emit(state.copyWith(
            status: DetailKasirStatus.error,
            errorMessage: 'Kasir tidak ditemukan',
          ));
          return;
        }

        emit(state.copyWith(
          status: DetailKasirStatus.loaded,
          kasirData: kasirData,
        ));
      } catch (e) {
        emit(state.copyWith(
          status: DetailKasirStatus.error,
          errorMessage: e.toString(),
        ));
      }
    });

    on<UpdateKasir>((event, emit) async {
      emit(state.copyWith(status: DetailKasirStatus.updating));

      try {
        final Kasir? kasirData = await _kasirRepo.getKasir({'id': event.id});

        if (kasirData == null) {
          emit(state.copyWith(
            status: DetailKasirStatus.error,
            errorMessage: 'Kasir tidak ditemukan',
          ));
          return;
        }

        final Kasir updatedKasir = (kasirData as KasirModel).copyWith(
          id: event.id,
          nama: event.nama,
          noHp: event.noHp,
          pin: event.pin,
        );

        await _kasirRepo.updateKasir(updatedKasir);

        emit(state.copyWith(
            status: DetailKasirStatus.updated, kasirData: updatedKasir));
      } catch (e) {
        emit(state.copyWith(
          status: DetailKasirStatus.error,
          errorMessage: e.toString(),
        ));
      }
    });
  }
}
