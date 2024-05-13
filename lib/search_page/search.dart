//search
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../shared/stock_card.dart';

class Search extends StatefulWidget {
  const Search({super.key});
  @override
  State<Search> createState() => _Search();
}
//home page
//individual stock info

class _Search extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //search bar
        SafeArea(
          child: SearchAnchor(
              builder: (BuildContext context, SearchController controller) {
            return SearchBar(
              controller: controller,
              padding: const MaterialStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16.0)),
              onTap: () {
                controller.openView();
              },
              onChanged: (_) {
                controller.openView();
              },
              leading: const Icon(Icons.search),
            );
          }, suggestionsBuilder:
                  (BuildContext context, SearchController controller) {
            return List<ListTile>.generate(5, (int index) { //list of suggestions, either get rid of or research dynamic autocomplete
              final String item = 'item $index';
              return ListTile(
                title: Text(item),
                onTap: () {
                  setState(() {
                    controller.closeView(item);
                  });
                },
              );
            });
          }),
        ),
        //stock card results
        Expanded(
          child: ListView(
            children: [
              StockCard(),
              StockCard(),
              StockCard(),
            ]
          ),
        )
      ],
    );
  }
}