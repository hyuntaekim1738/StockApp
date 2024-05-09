import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    return Column(
      children: [
        const Graph(),
        Expanded(
          child: ListView(
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text("My portfolio", textAlign: TextAlign.center),
              ),
              StockCard(),
              StockCard(),
              StockCard(),
            ],
          ),
        ),
      
      ],
    );
  }
}

