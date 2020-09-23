import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:medicine_reminder/service/login.dart';
import 'package:medicine_reminder/service/signup.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  navigateToLogin() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn()));
  }

  navigateToRegister() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 35.0),
            Container(
              height: 400,
              child: Image(
                height: 300,
                width: 250,
                image: AssetImage(
                  'images/start.png',
                ),
                fit: BoxFit.contain,
              ),
            ),
            Row(
              children: <Widget>[
                Text(
                  "   Welcome to",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 25.0),
                ),
                Expanded(
                    child: Text(
                  "Ashirwaad Hospital",
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 25.0),
                ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Better Care and Better Understanding',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  onPressed: navigateToLogin,
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  color: Colors.green,
                ),
                SizedBox(
                  width: 20,
                ),
                RaisedButton(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  onPressed: navigateToRegister,
                  child: Text(
                    'REGISTER',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  color: Colors.green,
                ),
                SizedBox(
                  height: 40.0,
                ),
              ],
            ),
// with custom text
            SignInButton(
              Buttons.Google,
              text: "Sign up with Google",
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
