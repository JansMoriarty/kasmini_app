import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasmini_app/domain/entities/produk.dart';
import 'package:kasmini_app/domain/repositories/produk_repo.dart';
import 'package:kasmini_app/presentation/bloc/produk/produk_event.dart';
import 'package:kasmini_app/presentation/bloc/produk/produk_state.dart';

class ProdukBloc extends Bloc<ProdukEvent, ProdukState> {
  final ProdukRepo _produkRepo;

  ProdukBloc(this._produkRepo) : super(const ProdukState()) {
    on<LoadAllProduk>((event, emit) async {
      emit(state.copyWith(status: StatusProduk.loading));
      
      try {
        final List<Produk>? produkData = await _produkRepo.getAllProduk();

        emit(state.copyWith(
          status: StatusProduk.loaded,
          produkData: produkData ?? [],
        ));
      } catch (e){
        emit(state.copyWith(
          status: StatusProduk.error,
          errorMessage: e.toString(),
        ));
      }
    });
  }
}