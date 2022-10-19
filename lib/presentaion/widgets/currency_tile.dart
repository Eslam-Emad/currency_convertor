import 'package:flutter/material.dart';

class CurrencyTile extends StatelessWidget {
  final String? name;
  final String? symbol;
  final VoidCallback onTap;

  const CurrencyTile(
      {Key? key, required this.name, required this.symbol, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(symbol ?? "-",
                style: const TextStyle(
                  fontSize: 16,
                )),
            Text(
              name ?? "-",
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
