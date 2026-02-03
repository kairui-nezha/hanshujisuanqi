import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/calculator/presentation/calculator_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Scientific Calculator',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CalculatorScreen(),
      ),
    );
  }
}