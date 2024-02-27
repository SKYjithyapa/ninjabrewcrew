import 'package:flutter/material.dart';
import 'package:ninjabrewcrew/Screens/authentication/register.dart';
import 'package:ninjabrewcrew/Screens/authentication/sign_in.dart';

class Authenticate extends StatefulWidget {
 

  @override
  _AuthenticState createState() => _AuthenticState();
}

class _AuthenticState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    // for change of screen
    if(showSignIn){
      return SignIn(toggleView: toggleView);
    }
    else{
      return Register(toggleView: toggleView);
    }


  }
}