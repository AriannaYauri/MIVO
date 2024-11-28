import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BarChartWidget extends StatelessWidget {
  final Map<String, int> data;
  final String title;

  const BarChartWidget({required this.data, required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<BarChartGroupData> barGroups = data.entries.map((entry) {
      return BarChartGroupData(
        x: data.keys.toList().indexOf(entry.key),
        barRods: [BarChartRodData(y: entry.value.toDouble(), colors: [Colors.green])],
      );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 200, child: BarChart(BarChartData(barGroups: barGroups))),
      ],
    );
  }
}
