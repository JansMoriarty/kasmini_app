import 'package:shared_preferences/shared_preferences.dart';

class KasirPreferencesService {
  static int? _selectedKasirId;
  final SharedPreferences sharedPreferences;

  KasirPreferencesService(this.sharedPreferences) {
    _selectedKasirId = sharedPreferences.getInt('selected_kasir_id');
  }

  int? get selectedKasirId => _selectedKasirId;

  set selectedKasirId(int? id) {
    _selectedKasirId = id;
    if (id != null) {
      sharedPreferences.setInt('selected_kasir_id', id);
    } else {
      sharedPreferences.remove('selected_kasir_id');
    }
  }
}