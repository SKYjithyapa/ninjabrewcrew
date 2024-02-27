import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ninjabrewcrew/Screens/home/home.dart';
import 'package:ninjabrewcrew/Screens/authentication/authentication.dart';
import 'package:provider/provider.dart';
import 'package:ninjabrewcrew/Models/user.dart';

class wrapper extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<CurrentUser?>(context);

      if(user ==null){
        return Authenticate();
      }
      else{
        return Home();  
      }




  }
}