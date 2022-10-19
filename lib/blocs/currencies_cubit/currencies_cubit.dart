import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/all_currencies_model.dart';
import '../../data/repositories/currencies_repository.dart';

part 'currencies_state.dart';

class CurrenciesCubit extends Cubit<CurrenciesState> {
  final CurrenciesRepository currenciesRepository;

  CurrenciesCubit(this.currenciesRepository) : super(CurrenciesInitial());

  AllCurrenciesModel? currenciesModel;
  getAllCurrencies() async {
    emit(CurrenciesLoading());
    try {
       currenciesModel = await currenciesRepository.getAllCurrencies();
      emit(CurrenciesLoaded(currenciesModel!));
    } catch (error) {
      emit(CurrenciesError(error));
    }
  }
}
