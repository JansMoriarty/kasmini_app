import 'package:kasmini_app/domain/entities/cashflow.dart';

abstract class CashflowRepo {
  Future<List<Cashflow>?> getAllCashflow({Map<String, dynamic> filter = const {}});
  Future<Cashflow?> getCashflow({Map<String, dynamic> filter = const {}});
  Future<void> addCashflow(Cashflow newCashflow);
  Future<void> updateCashflow(Cashflow cashflow);
  Future<void> deleteCashflow(int id);
}