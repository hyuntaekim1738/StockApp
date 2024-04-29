import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Graph extends StatefulWidget {
  const Graph(
      {super.key}); //maybe pass in a parameter that specifies whether or not we're looking at portfolio or stock
  @override
  State<Graph> createState() => _Graph();
}

class _Graph extends State<Graph> {
  var selectedIndex =
      0; //day, week, month, 6 month, year, ytd, all time (portfolio only)

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
      case 0:
        spots = daySpots;
        break;
      case 1:
        spots = weekSpots;
        break;
      case 2:
        spots = monthSpots;
        break;
      case 3:
        spots = sixMSpots;
        break;
      case 4:
        spots = yearSpots;
        break;
      case 5:
        spots = ytdSpots;
        break;
      case 6:
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
        NavigationBar(
            height: 25,
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
            onDestinationSelected: (int index) {
              setState(() {
                selectedIndex = index;
              });
            },
            indicatorColor: Theme.of(context).colorScheme.inversePrimary,
            selectedIndex: selectedIndex,
            destinations: const <Widget>[ //there is too much padding on top and items leak out of the bottom find a way to fix it
              NavigationDestination(
                //home navi
                icon: Icon(Icons.park),
                label: 'Day',
              ),
              NavigationDestination(
                //search navi
                icon: Icon(Icons.park),
                label: 'Week',
              ),
              NavigationDestination(
                //settings navi
                icon: Icon(Icons.park),
                label: 'Month',
              ),
              NavigationDestination(
                //settings navi
                icon: Icon(Icons.park),
                label: '6M',
              ),
              NavigationDestination(
                //settings navi
                icon: Icon(Icons.park),
                label: 'Year',
              ),
              NavigationDestination(
                //settings navi
                icon: Icon(Icons.park),
                label: 'YTD',
              ),
              NavigationDestination(
                //settings navi
                icon: Icon(Icons.park),
                label: 'All',
              ),
            ])
      ],
    );
  }
}