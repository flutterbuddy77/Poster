import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/bloc_layer/blocs/google_bloc.dart';
import 'package:poster/bloc_layer/events/google_event.dart';

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Success :)',
              style: TextStyle(
                fontSize: 60,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              child: Text('Sign Out'),
              onPressed: () {
                BlocProvider.of<GoogleBloc>(context).add(
                  SignOutClicked(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
