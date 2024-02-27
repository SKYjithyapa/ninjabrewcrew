import 'package:flutter/material.dart';
import 'package:ninjabrewcrew/Services/auth.dart';


class Register extends StatefulWidget {

   final Function toggleView;
  Register({required this.toggleView});
 



  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
   
     final AuthService _auth = AuthService();
     final _formKey = GlobalKey<FormState>();
   String email = '';
  String password = '';
  String error = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to Brew Crew'),
         actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign In'),
            onPressed: () {
               widget.toggleView();  // Implement the registration logic here
            },
          ),
        ],




      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val!.isEmpty ? 'Enter an email' : null,

                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(height: 20.0), // Add a missing closing parenthesis here
              TextFormField(

                 validator: (val) => val!.length < 6 ? 'Enter a PASSWORD 6+ chars long' : null,
                onChanged: (val) {

                  
                  setState(() {
                    password = val;
                  });
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink[400],
                ),
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if(_formKey.currentState!.validate()){
                  
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if(result == null){
                     setState(() {
                       error = 'please supply a valid email';
                     });
                    }else{
                      print('signed in');
                      print(result.uid);
                    }
                  
                   }
                  // Update the function call to use email and password
                },
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),)
            ],
          ),
        ),
      ),
    );
  }
}