import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/calculator_notifier.dart';
import 'widgets/display.dart';
import 'widgets/keypad.dart';

class CalculatorScreen extends ConsumerWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calculatorState = ref.watch(calculatorProvider);
    final calculatorNotifier = ref.read(calculatorProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scientific Calculator'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 600;
          return Column(
            children: [
              Expanded(
                flex: isWide ? 2 : 3,
                child: Display(
                  expression: calculatorState.expression,
                  result: calculatorState.result,
                ),
              ),
              Expanded(
                flex: 5,
                child: Keypad(
                  onButtonPressed: calculatorNotifier.onButtonPressed,
                  isWide: isWide,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}