import 'package:flutter/material.dart';
import 'package:poster/constants/routes.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Select login/signup type'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    Routes.LOGIN,
                  );
                },
                child: Text('Login/Signup with email'),
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                onPressed: () {},
                child: Text('Login/Signup with phone number'),
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                onPressed: () {},
                child: Text('Login/Signup with gmail'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
