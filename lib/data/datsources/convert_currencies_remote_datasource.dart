import 'package:dio/dio.dart';

import '../../core/constants/api_paths.dart';
import '../../core/helpers/exception/exceptions.dart';
import '../../core/network/cache_options_manager.dart';
import '../../core/network/dio_client.dart';

class ConvertCurrenciesRemoteDatasource {
  final DioClient _dioClient;

  ConvertCurrenciesRemoteDatasource(this._dioClient);

  Future<String> convertCurrency(
      String firstCurrency, String secondCurrency) async {
    try {
      final response = await _dioClient.get(
          currencyConvertEndpoint("${firstCurrency}_$secondCurrency"),
          options: CacheOptionsManager.instance.cacheOptions);
      final currencyDifferent =
          (response.data as Map<String?, dynamic>).values.first.toString();

      return currencyDifferent;
    } on DioError catch (dioError) {
      throw Failure.fromDioError(dioError);
    } catch (error) {
      throw '..Oops $error';
    }
  }
}
