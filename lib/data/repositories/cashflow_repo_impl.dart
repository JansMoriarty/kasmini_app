import 'package:kasmini_app/data/datasources/cashflow_local_data_source.dart';
import 'package:kasmini_app/domain/entities/cashflow.dart';
import 'package:kasmini_app/domain/repositories/cashflow_repo.dart';

class CashflowRepoImpl implements CashflowRepo {
  final CashflowLocalDataSource _localDataSource;

  CashflowRepoImpl(this._localDataSource);

  @override
  Future<List<Cashflow>?> getAllCashflow({Map<String, dynamic> filter = const {}}) async {
    final result = await _localDataSource.getAllCashflow(filter: filter);

    return result;
  }

  @override
  Future<Cashflow?> getCashflow({Map<String, dynamic> filter = const {}}) async {
    final result = await _localDataSource.getCashflow(filter: filter);

    return result;
  }

  @override
  Future<void> addCashflow(Cashflow newCashflow) async {
    await _localDataSource.addCashflow(newCashflow);
  }

  @override
  Future<void> updateCashflow(Cashflow cashflow) async {
    await _localDataSource.updateCashflow(cashflow);
  }

  @override
  Future<void> deleteCashflow(int id) async {
    await _localDataSource.deleteCashflow(id);
  }
}
