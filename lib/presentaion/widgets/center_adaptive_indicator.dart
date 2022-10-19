import 'package:flutter/material.dart';

class CenterAdaptiveIndicator extends StatelessWidget {
  const CenterAdaptiveIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator.adaptive());
  }
}
