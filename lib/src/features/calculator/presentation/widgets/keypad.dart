import 'package:flutter/material.dart';

class Keypad extends StatelessWidget {
  final void Function(String) onButtonPressed;
  final bool isWide;

  const Keypad({
    super.key,
    required this.onButtonPressed,
    required this.isWide,
  });

  @override
  Widget build(BuildContext context) {
    final buttons = [
      'AC', 'Del', '(', ')',
      '7', '8', '9', '÷',
      '4', '5', '6', '×',
      '1', '2', '3', '−',
      '0', '.', '=', '+',
      'sin(', 'cos(', 'tan(', 'log(',
      'ln(', '^', '√', '%',
    ];

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isWide ? 6 : 4,
        childAspectRatio: 1.2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      padding: const EdgeInsets.all(16.0),
      itemCount: buttons.length,
      itemBuilder: (context, index) {
        final button = buttons[index];
        return ElevatedButton(
          onPressed: () => onButtonPressed(button),
          style: ElevatedButton.styleFrom(
            backgroundColor: button == 'AC'
                ? Colors.red
                : button == '='
                    ? Colors.green
                    : Colors.blueGrey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Text(
            button,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}