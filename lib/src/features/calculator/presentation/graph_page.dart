import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:math_expressions/math_expressions.dart';
import '../../state/calculator_logic.dart';

class GraphPage extends StatefulWidget {
  const GraphPage({super.key});

  @override
  State<GraphPage> createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  final TextEditingController _controller = TextEditingController();
  List<FlSpot> _dataPoints = [];
  final CalculatorLogic _calculatorLogic = CalculatorLogic();

  void _generateGraph(String expression) {
    final parser = Parser();
    final context = ContextModel();
    _calculatorLogic.bindDegreeFunctions(context); // Use public method
    final List<FlSpot> points = [];

    try {
      final normalizedExpr = _calculatorLogic.normalize(expression); // Normalize input
      final exp = parser.parse(normalizedExpr);

      for (double x = -10; x <= 10; x += 0.1) {
        context.bindVariable(Variable('x'), Number(x));
        final y = exp.evaluate(EvaluationType.REAL, context);
        if (y.isFinite) {
          points.add(FlSpot(x, y));
        }
      }
      setState(() {
        _dataPoints = points;
      });
    } catch (e) {
      setState(() {
        _dataPoints = [];
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid expression. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Graph Page'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Enter function (e.g., x*x + 2)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => _generateGraph(_controller.text),
                  child: const Text('Plot'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: true),
                  titlesData: FlTitlesData(
                    leftTitles: SideTitles(showTitles: true),
                    bottomTitles: SideTitles(showTitles: true),
                  ),
                  borderData: FlBorderData(show: true),
                  lineBarsData: [
                    LineChartBarData(
                      spots: _dataPoints,
                      isCurved: true,
                      color: Colors.blue, // Updated to use single color
                      barWidth: 3,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}