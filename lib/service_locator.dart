import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'blocs/currencies_cubit/currencies_cubit.dart';
import 'blocs/currency_convertor_cubit/currency_convertor_cubit.dart';
import 'core/network/dio_client.dart';
import 'data/datsources/all_currencies_remote_datasource.dart';
import 'data/datsources/convert_currencies_remote_datasource.dart';
import 'data/datsources/historcal_currency_remote_datasource.dart';
import 'data/repositories/currencies_repository.dart';

GetIt sl = GetIt.instance;

Future<void> setup() async {
  // Blocs
  sl.registerFactory(() => CurrenciesCubit(sl()));
  sl.registerFactory(() => CurrencyConvertorCubit(sl()));

  // Repositories

  sl.registerLazySingleton(() => CurrenciesRepository(sl(), sl(), sl()));

  // DataSources

  sl.registerLazySingleton(() => AllCurrenciesRemoteDatasource(sl()));
  sl.registerLazySingleton(() => ConvertCurrenciesRemoteDatasource(sl()));
  sl.registerLazySingleton(() => HistoricalCurrencyRemoteDatasource(sl()));

  // External
  sl.registerLazySingleton(() => DioClient());
  sl.registerLazySingleton(() => Dio());
}
