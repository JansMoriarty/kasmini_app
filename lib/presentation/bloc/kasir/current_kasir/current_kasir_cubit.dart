import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasmini_app/common/services/kasir_preferences_service.dart';
import 'package:kasmini_app/domain/entities/kasir.dart';
import 'package:kasmini_app/domain/repositories/kasir_repo.dart';

class CurrentKasirCubit extends Cubit<Kasir?> {
  final KasirPreferencesService _kasirPreferencesService;
  final KasirRepo _kasirRepo;

  CurrentKasirCubit(this._kasirPreferencesService, this._kasirRepo)
      : super(null) {
    _init();
  }

  Future<void> _init() async {
    int? selectedKasirId = _kasirPreferencesService.selectedKasirId;
    final filter =
        selectedKasirId != null ? {'id': selectedKasirId} : {'role': 'owner'};

    Kasir? kasir = await _kasirRepo.getKasir(filter);

    if (kasir != null) {
      _kasirPreferencesService.selectedKasirId = kasir.id;
    }

    emit(kasir);
  }
}
