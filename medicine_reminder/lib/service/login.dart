import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medicine_reminder/homepage.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String _email, _password;

  checkAuthentification() async {
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    });

    @override
    void initState() {
      super.initState();
      this.checkAuthentification();
    }
  }

  @override

  // login function for authnetication

  login() async {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();

      try {
        UserCredential user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      } catch (e) {
        showError(e.errormessage);
      }
    }
  }

//popmessage
  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ERROR'),
            content: Text(errormessage),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 350,
                child: Image(
                    height: 350,
                    width: 300,
                    image: AssetImage('images/login.png')),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: TextFormField(
                            validator: (input) {
                              if (input.isEmpty) return 'Enter Email';
                            },
                            decoration: InputDecoration(
                                labelText: 'Email',
                                prefixIcon: Icon(Icons.email)),
                            onSaved: (input) => _email = input),
                      ),
                      Container(
                        child: TextFormField(
                            validator: (input) {
                              if (input.length < 6)
                                return 'Provide a minimum 6 character ';
                            },
                            decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                            ),
                            obscureText: true,
                            onSaved: (input) => _password = input),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FlatButton(
                          padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                          onPressed: login,
                          color: Colors.green,
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
