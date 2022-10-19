import '../datsources/all_currencies_remote_datasource.dart';
import '../datsources/convert_currencies_remote_datasource.dart';
import '../datsources/historcal_currency_remote_datasource.dart';

class CurrenciesRepository {
  final AllCurrenciesRemoteDatasource _allCurrenciesRemoteDatasource;
  final ConvertCurrenciesRemoteDatasource _convertCurrenciesRemoteDatasource;
  final HistoricalCurrencyRemoteDatasource _historicalCurrencyRemoteDatasource;

  CurrenciesRepository(
      this._allCurrenciesRemoteDatasource,
      this._convertCurrenciesRemoteDatasource,
      this._historicalCurrencyRemoteDatasource);

  Future getAllCurrencies() =>
      _allCurrenciesRemoteDatasource.getAllCurrencies();

  Future convertCurrency(String firstCurrency, String secondCurrency) async =>
      await _convertCurrenciesRemoteDatasource.convertCurrency(
          firstCurrency, secondCurrency);

  Future<Map> getHistoricalCurrency(
          {required String startDate,
          required String endDate,
          required String adversariesCurrencies}) async =>
      await _historicalCurrencyRemoteDatasource.getHistoricalCurrency(
          startDate: startDate,
          endDate: endDate,
          adversariesCurrencies: adversariesCurrencies);
}
