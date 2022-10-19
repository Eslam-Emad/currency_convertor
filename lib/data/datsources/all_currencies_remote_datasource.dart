import 'package:currency_converter/core/network/cache_options_manager.dart';
import 'package:dio/dio.dart';

import '../../core/constants/api_paths.dart';
import '../../core/network/dio_client.dart';
import '../../core/helpers/exception/exceptions.dart';
import '../model/all_currencies_model.dart';

class AllCurrenciesRemoteDatasource {
  final DioClient _dioClient;

  AllCurrenciesRemoteDatasource(this._dioClient);

  Future<AllCurrenciesModel> getAllCurrencies() async {
    try {
      final response = await _dioClient.get(allCountriesEndpoint,
          options: CacheOptionsManager.instance.cacheOptions);
      final currenciesList = AllCurrenciesModel.fromMap(response.data);
      return currenciesList;
    } on DioError catch (dioError) {
      throw Failure.fromDioError(dioError);
    } catch (error) {
      throw '..Oops $error';
    }
  }
}
