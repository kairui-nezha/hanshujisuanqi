import 'dart:math' as math;

import 'package:math_expressions/math_expressions.dart';

class CalculatorLogic {
  String calculate(String input) {
    final expression = _normalize(input).trim();
    if (expression.isEmpty) {
      return '0';
    }

    try {
      final parser = Parser();
      final context = ContextModel();
      bindDegreeFunctions(context);

      final exp = parser.parse(expression);
      final value = exp.evaluate(EvaluationType.REAL, context);

      if (value.isNaN || value.isInfinite) {
        return 'Error';
      }

      return _formatNumber(value);
    } catch (_) {
      return 'Error';
    }
  }

  String _normalize(String input) {
    var normalized = input
        .replaceAll('×', '*')
        .replaceAll('÷', '/')
        .replaceAll('−', '-')
        .replaceAll('√', 'sqrt')
        .replaceAll('π', 'pi');

    // Add multiplication sign between number and trigonometric functions
    normalized = normalized.replaceAllMapped(
      RegExp(r'(\d)(sin|cos|tan)'),
      (match) => '${match[1]}*${match[2]}'
    );

    // Replace percentage with division by 100
    normalized = normalized.replaceAll('%', '/100');

    // Replace trigonometric functions with degree-based versions
    return normalized
        .replaceAll(RegExp(r'sin(?=\s*\()'), 'sind')
        .replaceAll(RegExp(r'cos(?=\s*\()'), 'cosd')
        .replaceAll(RegExp(r'tan(?=\s*\()'), 'tand');
  }

  void bindDegreeFunctions(ContextModel context) {
    context.bindFunction(Function('sind', 1), (args) {
      final angle = _toDouble(args[0]);
      return math.sin(_degToRad(angle));
    });

    context.bindFunction(Function('cosd', 1), (args) {
      final angle = _toDouble(args[0]);
      return math.cos(_degToRad(angle));
    });

    context.bindFunction(Function('tand', 1), (args) {
      final angle = _toDouble(args[0]);
      return math.tan(_degToRad(angle));
    });
  }

  double _degToRad(double degree) => degree * (math.pi / 180.0);

  double _toDouble(dynamic value) {
    if (value is num) {
      return value.toDouble();
    }
    return double.tryParse(value.toString()) ?? double.nan;
  }

  String _formatNumber(double value) {
    final text = value.toString();
    if (!text.contains('.')) {
      return text;
    }
    final trimmedZeros = text.replaceFirst(RegExp(r'(\.\d*?[1-9])0+$'), r'$1');
    if (trimmedZeros.endsWith('.')) {
      return trimmedZeros.substring(0, trimmedZeros.length - 1);
    }
    return trimmedZeros.replaceFirst(RegExp(r'\.0+$'), '');
  }

  String normalize(String input) {
    var normalized = input
        .replaceAll('×', '*')
        .replaceAll('÷', '/')
        .replaceAll('−', '-')
        .replaceAll('√', 'sqrt')
        .replaceAll('π', 'pi');

    // Add multiplication sign between number and trigonometric functions
    normalized = normalized.replaceAllMapped(
      RegExp(r'(\d)(sin|cos|tan)'),
      (match) => '${match[1]}*${match[2]}'
    );

    // Replace percentage with division by 100
    normalized = normalized.replaceAll('%', '/100');

    // Replace trigonometric functions with degree-based versions
    return normalized
        .replaceAll(RegExp(r'sin(?=\s*\()'), 'sind')
        .replaceAll(RegExp(r'cos(?=\s*\()'), 'cosd')
        .replaceAll(RegExp(r'tan(?=\s*\()'), 'tand');
  }
}
