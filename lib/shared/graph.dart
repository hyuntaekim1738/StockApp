import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Graph extends StatefulWidget {
  const Graph(
      {super.key}); //maybe pass in a parameter that specifies whether or not we're looking at portfolio or stock
  @override
  State<Graph> createState() => _Graph();
}

enum GraphType {day, week, month, sixM, year, ytd, all}

class _Graph extends State<Graph> {
  GraphType selectedIndex = GraphType.day; //day, week, month, 6 month, year, ytd, all time (portfolio only)

  //initialize list of sample fl spots
  List<FlSpot> daySpots = [
    //research methods to convert datetime to integer/double
    const FlSpot(3, 5),
    const FlSpot(4, 6),
    const FlSpot(7, 9),
  ];
  List<FlSpot> weekSpots = [
    const FlSpot(0, 5),
    const FlSpot(4, 6),
    const FlSpot(7, 9),
  ];
  List<FlSpot> monthSpots = [
    const FlSpot(0, 5),
    const FlSpot(4, 6),
    const FlSpot(10, 9),
  ];
  List<FlSpot> sixMSpots = [
    const FlSpot(0, 5),
    const FlSpot(3, 6),
    const FlSpot(7, 9),
  ];
  List<FlSpot> yearSpots = [
    const FlSpot(0, 5),
    const FlSpot(7, 9),
  ];
  List<FlSpot> ytdSpots = [
    const FlSpot(0, 5),
    const FlSpot(4, 6),
    const FlSpot(7, 9),
  ];
  List<FlSpot> allTimeSpots = [
    const FlSpot(0, 5),
  ];

  @override
  Widget build(BuildContext context) {
    List<FlSpot> spots = [
      const FlSpot(0, 1),
    ];
    switch (selectedIndex) {
      case GraphType.day:
        spots = daySpots;
        break;
      case GraphType.week:
        spots = weekSpots;
        break;
      case GraphType.month:
        spots = monthSpots;
        break;
      case GraphType.sixM:
        spots = sixMSpots;
        break;
      case GraphType.year:
        spots = yearSpots;
        break;
      case GraphType.ytd:
        spots = ytdSpots;
        break;
      case GraphType.all:
        spots = allTimeSpots;
        break;
      default:
        throw UnimplementedError('no graph for $selectedIndex');
    }
    return Column(
      children: [
        SafeArea(
          child: SizedBox(
              height: 400,
              width: 400,
              //graph
              child: LineChart(LineChartData(
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
                    leftTitles: AxisTitles(
                        sideTitles:
                            SideTitles(reservedSize: 40, showTitles: true)),
                    bottomTitles: AxisTitles(
                        sideTitles:
                            SideTitles(reservedSize: 40, showTitles: true)),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  )))
              //line chart navigation
              ),
        ),
        SegmentedButton<GraphType>(
          style: SegmentedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
            selectedBackgroundColor: Theme.of(context).colorScheme.inversePrimary,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            textStyle: DefaultTextStyle.of(context).style.apply(fontSizeFactor: .6),
          ),
          segments: const <ButtonSegment<GraphType>>[
            ButtonSegment<GraphType>(
                value: GraphType.day,
                label: Text('D'),
                icon: Icon(Icons.park)),
                
            ButtonSegment<GraphType>(
                value: GraphType.week,
                label: Text('W'),
                icon: Icon(Icons.park)),
            ButtonSegment<GraphType>(
                value: GraphType.month,
                label: Text('M'),
                icon: Icon(Icons.park)),
            ButtonSegment<GraphType>(
                value: GraphType.sixM,
                label: Text('6M'),
                icon: Icon(Icons.park)),
            ButtonSegment<GraphType>(
                value: GraphType.year,
                label: Text('Y'),
                icon: Icon(Icons.park)),
            ButtonSegment<GraphType>(
                value: GraphType.ytd,
                label: Text('YTD'),
                icon: Icon(Icons.park)),
            ButtonSegment<GraphType>(
                value: GraphType.all,
                label: Text('A'),
                icon: Icon(Icons.park)),
          ],
          selected: <GraphType>{selectedIndex},
          onSelectionChanged: (Set<GraphType> newSelection) 
          {
            setState(() {
              selectedIndex = newSelection.first;
            });
          },
        ),
      ],
    );
  }
}