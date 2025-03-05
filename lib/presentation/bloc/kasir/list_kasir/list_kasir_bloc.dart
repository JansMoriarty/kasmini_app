import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasmini_app/domain/entities/kasir.dart';
import 'package:kasmini_app/domain/repositories/kasir_repo.dart';
import 'package:kasmini_app/presentation/bloc/kasir/list_kasir/list_kasir_event.dart';
import 'package:kasmini_app/presentation/bloc/kasir/list_kasir/list_kasir_state.dart';

class ListKasirBloc extends Bloc<ListKasirEvent, ListKasirState> {
  final KasirRepo _kasirRepo;

  ListKasirBloc(this._kasirRepo) : super(const ListKasirState()) {
    on<LoadAllKasir>((event, emit) async {
      emit(state.copyWith(status: StatusKasir.loading));

      try {
        final List<Kasir>? kasirData = await _kasirRepo.getAllKasir();

        emit(state.copyWith(
          status: StatusKasir.loaded,
          kasirData: kasirData ?? [],
        ));
      } catch (e) {
      emit(state.copyWith(
          status: StatusKasir.error,
          errorMessage: e.toString(),
        ));
      }
    });

    on<AddKasir>((event, emit) async {
      emit(state.copyWith(status: StatusKasir.loading));

      try {
        final Kasir newKasir = Kasir(
          id: null,
          nama: event.nama,
          noHp: event.noHp,
          pin: event.pin,
          role: RoleKasir.kasir,
        );

        await _kasirRepo.addKasir(newKasir);
        final List<Kasir>? updatedKasirData = await _kasirRepo.getAllKasir();

        emit(state.copyWith(
          status: StatusKasir.loaded,
          kasirData: updatedKasirData ?? [],
        ));
      } catch (e) {
        emit(state.copyWith(
          status: StatusKasir.error,
          errorMessage: e.toString(),
        ));
      }
    });

    on<DeleteKasir>((event, emit) async {
      emit(state.copyWith(status: StatusKasir.loading));

      try {
        await _kasirRepo.deleteKasir(event.id);
        final List<Kasir>? updatedKasirData = await _kasirRepo.getAllKasir();

        emit(state.copyWith(
          status: StatusKasir.loaded,
          kasirData: updatedKasirData ?? [],
        ));
      } catch (e) {
        emit(state.copyWith(
          status: StatusKasir.error,
          errorMessage: e.toString(),
        ));
      }
    });
  }
}
