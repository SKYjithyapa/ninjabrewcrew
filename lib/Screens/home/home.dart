import 'package:flutter/material.dart';
import 'package:ninjabrewcrew/Services/auth.dart';
class Home extends StatelessWidget {
 
  final AuthService _auth = AuthService();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Brew Crew'),
        actions: <Widget>[
          TextButton.icon(
          
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async {
              await _auth.signOut();// Your onPressed logic goes here
            },
          ),
        ],
      ),
      body: Container(
       
      ),
    );
  }
}
