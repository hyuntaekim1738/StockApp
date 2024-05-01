import 'package:flutter/material.dart';

class StockCard extends StatelessWidget {
  const StockCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView( //make this a card
      padding: const EdgeInsets.all(8),
      children: const <Widget>[
        ListTile( title: Icon(Icons.battery_full)),
        ListTile( title: Icon(Icons.anchor)),
        ListTile( title: Icon(Icons.access_alarm)),
        ListTile(title: Icon(Icons.ballot)),ListTile( title: Icon(Icons.battery_full)),
        ListTile( title: Icon(Icons.anchor)),
        ListTile( title: Icon(Icons.access_alarm)),
        ListTile(title: Icon(Icons.ballot)),
      ],
    );
  }
}
