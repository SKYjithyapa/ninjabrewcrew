import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:ninjabrewcrew/Models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  // auth change user stream
  Stream<CurrentUser?> get user {
    return _auth.authStateChanges().map(_customModelForFirebaseUser);
  }


  // create user object based on firebase user
  CurrentUser? _customModelForFirebaseUser(User? user) {
    return user != null ? CurrentUser(uid: user.uid) : null;
  }

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _customModelForFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Other authentication methods can be added here

  // sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? CurrentUser = result.user;
      return _customModelForFirebaseUser(CurrentUser);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }





  // register with email & password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? CurrentUser = result.user;
      return _customModelForFirebaseUser(CurrentUser);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  
  
  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }






}
