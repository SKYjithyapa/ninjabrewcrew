import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ninjabrewcrew/Models/user.dart';
import 'package:ninjabrewcrew/Screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ninjabrewcrew/Services/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<CurrentUser?>.value(
      value: AuthService().user,
      initialData: null, // Provide an initial value or null based on your use case
      child: MaterialApp(
        home: wrapper(),
      ),
    );
  }
}
