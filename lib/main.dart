import 'package:currency_converter/presentaion/pages/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

import 'core/init_app.dart';

void main() => InitializeApp.run();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Currency Convertor',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}
