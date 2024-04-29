import 'package:flutter/material.dart';
import '../shared/graph.dart';

class StockHome extends StatefulWidget {
  const StockHome({super.key});
  @override
  State<StockHome> createState() => _StockHome();
}
//home page

//graph

//settings of which graph for which time period you want

//individual stock info

class _StockHome extends State<StockHome> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Graph(),
    );
  }
}

