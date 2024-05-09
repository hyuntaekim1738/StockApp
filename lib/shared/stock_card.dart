import 'package:flutter/material.dart';
import './graph.dart';
class StockCard extends StatelessWidget {
  const StockCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: FlutterLogo(),
        title: Text('One-line with leading widget'),
        onTap:() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StockInfo(),
            ),
          );
        }
      ),
    );
  }
}

class StockInfo extends StatelessWidget {
  const StockInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children:[
        const Graph(),
        //box for user stock purchase
        Card(
          margin: const EdgeInsets.all(5.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          color: Colors.grey.withOpacity(0.25),
          child: const Column(
            children: [
              Row(
                children: [
                  Text("Stock info"),
                  Text("Stock info"),
                ],
              ),
              Row(
                children: [
                  Text("Stock info"),
                  Text("Stock info"),
                ],
              ),
            ],
          ),
        ),
        //box for generic stock info
        Card(
          margin: const EdgeInsets.all(5.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          color: Colors.grey.withOpacity(0.25),
          child: const Column(
            children: [
              Row(
                children: [
                  Text("Stock info"),
                  Text("Stock info"),
                ],
              ),
              Row(
                children: [
                  Text("Stock info"),
                  Text("Stock info"),
                ],
              ),
            ],
          ),
        ),
        ElevatedButton(
          child: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          }
        ),
      ]
    )
  );
  }
}