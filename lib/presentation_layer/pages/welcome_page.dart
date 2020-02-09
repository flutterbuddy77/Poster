import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/bloc_layer/events/google_event.dart';
import 'package:poster/bloc_layer/google_bloc.dart';
import 'package:poster/constants/routes.dart';
import 'package:toast/toast.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GoogleBloc, GoogleState>(
      listenWhen: (prev, current) =>
          current is SuccessSignIn || current is ErrorHappened,
      listener: (context, state) {
        if (state is SuccessSignIn) {
          Navigator.of(context).pushNamed(
            Routes.SUCCESS,
          );
        } else if (state is ErrorHappened) {
          Toast.show(
            state.errorMessage,
            context,
            duration: Toast.LENGTH_SHORT,
            gravity: Toast.BOTTOM,
          );
        }
      },
      builder: (context, state) {
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
                    onPressed: () {
                      BlocProvider.of<GoogleBloc>(context).add(
                        SignInWithGoogleClicked(),
                      );
                    },
                    child: Text('Login/Signup with gmail'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
