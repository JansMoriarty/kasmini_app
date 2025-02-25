import 'package:kasmini_app/domain/entities/template_struk.dart';

abstract class TemplateStrukRepo {
  Future<List<TemplateStruk>?> getAllTemplateStruk({Map<String, dynamic> filter = const {}});
  Future<TemplateStruk?> getTemplateStruk({Map<String, dynamic> filter = const {}});
  Future<void> addTemplateStruk(TemplateStruk newTemplateStruk);
  Future<void> updateTemplateStruk(TemplateStruk templateStruk);
  Future<void> deleteTemplateStruk(int id);
}