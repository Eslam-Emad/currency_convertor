import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repositories/currencies_repository.dart';

part 'currency_convertor_state.dart';

class CurrencyConvertorCubit extends Cubit<CurrencyConvertorState> {
  final CurrenciesRepository _currenciesRepository;

  CurrencyConvertorCubit(this._currenciesRepository)
      : super(CurrencyConvertorInitial());

  convertCurrency(String firstCurrency, String secondCurrency) async {
    emit(CurrencyConvertorLoading());
    try {
      final String currenciesDifferent = await _currenciesRepository
          .convertCurrency(firstCurrency, secondCurrency);
      emit(CurrencyConvertorLoaded(currenciesDifferent));
    } catch (error) {
      emit(CurrencyConvertorError(error));
    }
  }
}
