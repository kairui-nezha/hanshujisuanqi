import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final String expression;
  final String result;

  const Display({
    super.key,
    required this.expression,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            expression,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            result,
            style: const TextStyle(
              fontSize: 48,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}