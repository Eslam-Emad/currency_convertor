import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/currencies_cubit/currencies_cubit.dart';
import '../../../service_locator.dart';
import '../../widgets/center_adaptive_indicator.dart';
import '../../widgets/currency_tile.dart';
import '../currency_convertor_screen/currency_convertor_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CurrenciesCubit>()..getAllCurrencies(),
      child: Scaffold(
          appBar: AppBar(),
          body: BlocBuilder<CurrenciesCubit, CurrenciesState>(
            builder: (context, state) {
              if (state is CurrenciesLoaded) {
                return ListView.builder(
                  itemCount:
                      state.currenciesModel.results?.values.toList().length,
                  itemBuilder: (context, index) {
                    return CurrencyTile(
                        onTap: () {
                          /// normal way of navigation for simplicity
                          /// we can replace it with other navigation solutions for real world project
                          /// like named route - auto route or any navigator2 package
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => CurrencyConvertorScreen(
                                  selectedFirstCurrencyModelData: state
                                      .currenciesModel.results!.values
                                      .toList()[index],
                                  currenciesModel: state.currenciesModel)));
                        },
                        symbol: state.currenciesModel.results?.values
                            .toList()[index]
                            .alpha3,
                        name: state.currenciesModel.results?.values
                            .toList()[index]
                            .name);
                  },
                );
              } else if (state is CurrenciesError) {
                return Center(child: Text(state.error.toString()));
              } else {
                return const CenterAdaptiveIndicator();
              }
            },
          )),
    );
  }
}


