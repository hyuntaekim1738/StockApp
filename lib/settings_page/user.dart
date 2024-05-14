import 'package:flutter/material.dart';

class User extends StatefulWidget { 
  const User({super.key});
  @override
  State<User> createState() => _User();
}

class _User extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [ //let's not make it a form for now
          const SafeArea(
            child: 
              Card( //style it to have similar properties to the input field
                child: Text("Current email: "),
              ),
          ),
          Row(
            children: [
              Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Change email',
                    ),
                  ),
              ),
              ElevatedButton(
                child: const Text("Confirm"),
                onPressed: () {
      
                }
              )
      
            ],
          ),
          Row(
            children: [
              Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Change Password',
                    ),
                  ),
              ),
              ElevatedButton(
                child: const Text("Confirm"),
                onPressed: () {
      
                }
              )
      
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text("Log Out"),
                onPressed: () {
      
                }
              )
      
            ],
          ),
          ElevatedButton(
            child: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }
          ),
        ],
      ),
    );
  }
}


//password change
//log out