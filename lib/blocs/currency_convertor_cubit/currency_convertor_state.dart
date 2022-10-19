part of 'currency_convertor_cubit.dart';

abstract class CurrencyConvertorState extends Equatable {
  const CurrencyConvertorState();

  @override
  List<Object> get props => [];
}

class CurrencyConvertorInitial extends CurrencyConvertorState {}

class CurrencyConvertorLoading extends CurrencyConvertorState {}

class CurrencyConvertorLoaded extends CurrencyConvertorState {
  final String currenciesDifference;

  const CurrencyConvertorLoaded(this.currenciesDifference);

  @override
  List<Object> get props => [currenciesDifference];
}

class CurrencyConvertorError extends CurrencyConvertorState {
  final dynamic error;

  const CurrencyConvertorError(this.error);

  @override
  List<Object> get props => [error];
}
