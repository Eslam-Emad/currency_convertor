part of 'currencies_cubit.dart';

abstract class CurrenciesState extends Equatable {
  const CurrenciesState();

  @override
  List<Object> get props => [];
}

class CurrenciesInitial extends CurrenciesState {}

class CurrenciesLoading extends CurrenciesState {}

class CurrenciesLoaded extends CurrenciesState {
  final AllCurrenciesModel currenciesModel;

  const CurrenciesLoaded(this.currenciesModel);

  @override
  List<Object> get props => [currenciesModel];
}

class CurrenciesError extends CurrenciesState {
  final dynamic error;

  const CurrenciesError(this.error);

  @override
  List<Object> get props => [error];
}
