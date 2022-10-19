import 'package:flutter/material.dart';

import '../../data/model/all_currencies_model.dart';

class DropDownCurrencyWidget extends StatefulWidget {
  final List<Result> currencyList;
  final ValueChanged<Result> onValueChanged;

  const DropDownCurrencyWidget({
    Key? key,
    required this.currencyList,
    required this.onValueChanged,
  }) : super(key: key);

  @override
  DropDownCurrencyWidgetState createState() => DropDownCurrencyWidgetState();
}

class DropDownCurrencyWidgetState extends State<DropDownCurrencyWidget> {
  late Result selectedCurrency;

  @override
  void initState() {
    selectedCurrency = widget.currencyList.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton(
            value: selectedCurrency,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: widget.currencyList.map((Result items) {
              return DropdownMenuItem(
                  value: items, child: Text(items.alpha3 ?? ""));
            }).toList(),
            onChanged: (value) {
              setState(() => selectedCurrency = value!);
              widget.onValueChanged(value!);
            },
          ),
        ],
      ),
    );
  }
}
