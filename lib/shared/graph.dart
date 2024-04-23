import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Graph extends StatefulWidget {
  const Graph({super.key});
  @override
  State<Graph> createState() => _Graph();
}

class _Graph extends State<Graph> {
  var selectedIndex = 0;
  //initialize list of sample fl spots
  List<FlSpot> spots = [ //research methods to convert datetime to integer/double
    const FlSpot(3, 5),
    const FlSpot(4, 6),
    const FlSpot(7, 9),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: 400,
        width: 400,
        //graph
        child: LineChart( 
          LineChartData(
            minY: 0,
            maxY: 10, //set this later to the user's total profit * 1.25
            //data points
            lineBarsData: [
              LineChartBarData(
                spots: spots, 
                color: Theme.of(context).colorScheme.inversePrimary,
                barWidth: 3,
              ),
            ],
            //title labels
            titlesData: const FlTitlesData(
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
                axisNameWidget: Text('Portfolio Performance'),
              ),
              leftTitles: AxisTitles(sideTitles: SideTitles(reservedSize: 40, showTitles: true)),
              bottomTitles: AxisTitles(sideTitles: SideTitles(reservedSize: 40, showTitles: true)),
              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false),),
            )
          )
        )
        //line chart navigation
      ),
    )
    );
  }
}