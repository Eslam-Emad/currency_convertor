import 'package:dio/dio.dart';

import '../../core/constants/api_paths.dart';
import '../../core/helpers/exception/exceptions.dart';
import '../../core/network/dio_client.dart';

class HistoricalCurrencyRemoteDatasource {
  final DioClient _dioClient;

  HistoricalCurrencyRemoteDatasource(this._dioClient);

  Future<Map> getHistoricalCurrency(
      {required String startDate,
      required String endDate,
      required String adversariesCurrencies}) async {
    try {
      final response = await _dioClient.get(currencyHistoryEndpoint(
          startDate: startDate,
          endDate: endDate,
          adversariesCurrencies: adversariesCurrencies));
      return (response.data as Map<String, dynamic>);
    } on DioError catch (dioError) {
      throw Failure.fromDioError(dioError);
    } catch (error) {
      throw '..Oops $error';
    }
  }
}
