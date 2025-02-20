import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasmini_app/domain/entities/kasir.dart';
import 'package:kasmini_app/domain/repositories/kasir_repo.dart';
import 'package:kasmini_app/presentation/bloc/kasir/kasir_event.dart';
import 'package:kasmini_app/presentation/bloc/kasir/kasir_state.dart';

class KasirBloc extends Bloc<KasirEvent, KasirState> {
  final KasirRepo _kasirRepo;

  KasirBloc(this._kasirRepo) : super(const KasirState()) {
    on<LoadKasir>((event, emit) async {
      emit(state.copyWith(status: KasirStatus.loading));

      try {
        final List<Kasir>? kasirData = await _kasirRepo.getAllKasir();

        emit(state.copyWith(
          status: KasirStatus.loaded,
          kasirData: kasirData ?? [],
        ));
      } catch (e) {
        emit(state.copyWith(
          status: KasirStatus.error,
          errorMessage: e.toString(),
        ));
      }
    });

    on<AddKasir>((event, emit) async {
      emit(state.copyWith(status: KasirStatus.loading));

      try {
        final Kasir newKasir = Kasir(
          id: null,
          nama: event.nama,
          noHp: event.noHp,
          pin: event.pin,
          role: event.role,
        );

        await _kasirRepo.addKasir(newKasir);
        final List<Kasir>? updatedKasirData = await _kasirRepo.getAllKasir();

        emit(state.copyWith(
          status: KasirStatus.loaded,
          kasirData: updatedKasirData ?? [],
        ));
      } catch (e) {
        emit(state.copyWith(
          status: KasirStatus.error,
          errorMessage: e.toString(),
        ));
      }
    });

    on<UpdateKasir>((event, emit) async {
      emit(state.copyWith(status: KasirStatus.loading));

      try {
        final int index = state.kasirData.indexWhere(
          (kasir) => kasir.id == event.id,
        );
        final Kasir updatedKasir;

        if (index != -1) {
          updatedKasir = Kasir(
            id: event.id,
            nama: event.nama,
            noHp: event.noHp,
            pin: event.pin,
            role: state.kasirData[index].role,
          );
        } else {
          final Kasir? existingKasir = await _kasirRepo.getKasir({
            'id': event.id,
          });

          if (existingKasir == null) {
            emit(state.copyWith(
              status: KasirStatus.error,
              errorMessage: "Kasir not found",
            ));
            return;
          }
          
          updatedKasir = Kasir(
            id: event.id,
            nama: event.nama,
            noHp: event.noHp,
            pin: event.pin,
            role: existingKasir.role,
          );
        }

        await _kasirRepo.updateKasir(updatedKasir);
        final List<Kasir>? updatedKasirData = await _kasirRepo.getAllKasir();

        emit(state.copyWith(
          status: KasirStatus.loaded,
          kasirData: updatedKasirData ?? [],
        ));
      } catch (e) {
        emit(state.copyWith(
          status: KasirStatus.error,
          errorMessage: e.toString(),
        ));
      }
    });

    on<DeleteKasir>((event, emit) async {
      emit(state.copyWith(status: KasirStatus.loading));

      try {
        await _kasirRepo.deleteKasir(event.id);
        final List<Kasir>? updatedKasirData = await _kasirRepo.getAllKasir();

        emit(state.copyWith(
          status: KasirStatus.loaded,
          kasirData: updatedKasirData ?? [],
        ));
      } catch (e) {
        emit(state.copyWith(
          status: KasirStatus.error,
          errorMessage: e.toString(),
        ));
      }
    });
  }
}
