import 'package:flutter/material.dart';
import '../shared/graph.dart';
import '../shared/stock_card.dart';

class StockHome extends StatefulWidget {
  const StockHome({super.key});
  @override
  State<StockHome> createState() => _StockHome();
}
//home page
//individual stock info

class _StockHome extends State<StockHome> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Graph(),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("My portfolio"),
        ),
        Expanded(
          child: StockCard(),
        ),
      
      ],
    );
  }
}

