import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/currency_convertor_cubit/currency_convertor_cubit.dart';
import '../../../data/model/all_currencies_model.dart';
import '../../../service_locator.dart';
import '../../widgets/center_adaptive_indicator.dart';
import '../../widgets/drop_down_currency_widget.dart';

class CurrencyConvertorScreen extends StatefulWidget {
  final AllCurrenciesModel currenciesModel;
  final Result selectedFirstCurrencyModelData;

  const CurrencyConvertorScreen(
      {Key? key,
      required this.currenciesModel,
      required this.selectedFirstCurrencyModelData})
      : super(key: key);

  @override
  State<CurrencyConvertorScreen> createState() =>
      _CurrencyConvertorScreenState();
}

class _CurrencyConvertorScreenState extends State<CurrencyConvertorScreen> {
  Result? selectedSecondCurrencyModelData;

  @override
  void initState() {
    selectedSecondCurrencyModelData =
        widget.currenciesModel.results!.values.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CurrencyConvertorCubit>(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<CurrencyConvertorCubit, CurrencyConvertorState>(
          buildWhen: (_, __) => false,
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.selectedFirstCurrencyModelData.name ?? ""),
                Text(
                    "Convert ${widget.selectedFirstCurrencyModelData.alpha3} to :"),
                DropDownCurrencyWidget(
                  currencyList:
                      widget.currenciesModel.results!.values.toSet().toList(),
                  onValueChanged: (value) {
                    selectedSecondCurrencyModelData = value;
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<CurrencyConvertorCubit>().convertCurrency(
                          widget.selectedFirstCurrencyModelData.alpha3!,
                          selectedSecondCurrencyModelData!.alpha3!);
                    },
                    child: const Text("Convert")),
                BlocBuilder<CurrencyConvertorCubit, CurrencyConvertorState>(
                  builder: (context, state) {
                    if (state is CurrencyConvertorLoading) {
                      return const CenterAdaptiveIndicator();
                    } else if (state is CurrencyConvertorLoaded) {
                      return Text(state.currenciesDifference.toString());
                    }
                    return const Text("No Result");
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
