import 'package:flutter/material.dart';
import 'home_page/stock_home.dart';
import 'search_page/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //underscore signifies private class
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const StockHome(); //home page
        break;
      case 1:
        page = const Search(); //search page
        break;
      case 2:
        page = const Placeholder(); //settings/user page
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return Scaffold(
      //pages
      body: page,
      //navigation bar
      bottomNavigationBar: NavigationBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        onDestinationSelected: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        indicatorColor: Theme.of(context).colorScheme.primaryContainer,
        selectedIndex: selectedIndex,
        destinations: const <Widget>[
          NavigationDestination( //home navi
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination( //search navi
            icon: Icon(Icons.search_outlined),
            label: 'Search',
          ),
          NavigationDestination( //settings navi
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
