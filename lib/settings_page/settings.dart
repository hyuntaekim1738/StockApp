import 'package:flutter/material.dart';
import './user.dart';
//overview of settings just in case we want to add more settings than user settings
//on tap of card that routes to user settings
//later add more aesthetic settings like a light/dark mode toggle
class Settings extends StatelessWidget{
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Card(
            child: ListTile(
              title: const Text('User Settings'),
              onTap:() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const User(),
                  ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}