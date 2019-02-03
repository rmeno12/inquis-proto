import 'package:flutter/material.dart';
import 'package:inquis_proto/timeline.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userController = TextEditingController();
  final passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0,),
            Column(
              children: <Widget>[
                Image.asset('assets/inquis_icon.png', width: 150.0,),
              ],
            ),
            SizedBox(height: 100.0,),
            TextField(
              controller: userController,
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              decoration: InputDecoration(
                labelText: 'Username or Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                filled: true,
              ),
            ),
            SizedBox(height: 12.0,),
            TextField(
              controller: passwordController,
              autocorrect: false,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                filled: true,
              ),
              obscureText: true,
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('Cancel'),
                  onPressed: (){},
                ),
                RaisedButton(
                  child: Text('Login'),
                  onPressed: (){
                    if(passwordController.text == 'diamond' && userController.text != ''){
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => new TimelinePage())
                      );
                    }
                  },
                )
              ],
            )
          ],
        )
      ),
    );
  }
}