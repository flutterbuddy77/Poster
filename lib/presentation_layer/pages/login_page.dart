import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/bloc_layer/login_bloc.dart';
import 'package:poster/presentation_layer/pages/success_page.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() async {
    super.dispose();
    _usernameController?.dispose();
    _passwordController?.dispose();
    await BlocProvider.of<EmailBloc>(context).close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmailBloc, LoginState>(
        listenWhen: (prev, current) =>
            current is SuccessLoginState || current is ErrorLoginState,
        listener: (context, state) {
          if (state is SuccessLoginState) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => SuccessPage(),
              ),
            );
          }

          if (state is ErrorLoginState) {
            Toast.show(
              state.errorMessage,
              context,
              duration: Toast.LENGTH_SHORT,
              gravity: Toast.BOTTOM,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    StreamBuilder<String>(
                        stream: BlocProvider.of<EmailBloc>(context).username,
                        builder: (context, snapshot) {
                          return TextFormField(
                            controller: _usernameController,
                            onChanged: BlocProvider.of<EmailBloc>(context)
                                .usernameChanged,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'username',
                              errorText: snapshot.error,
                            ),
                          );
                        }),
                    SizedBox(
                      height: 15,
                    ),
                    StreamBuilder<String>(
                      stream: BlocProvider.of<EmailBloc>(context).password,
                      builder: (context, snapshot) {
                        return TextFormField(
                          controller: _passwordController,
                          onChanged: BlocProvider.of<EmailBloc>(context)
                              .passwordChanged,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'password',
                            errorText: snapshot.error,
                          ),
                          obscureText: true,
                        );
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    StreamBuilder<String>(
                      stream: BlocProvider.of<EmailBloc>(context).username,
                      builder: (context, usernameSnapshot) {
                        return StreamBuilder<String>(
                          stream: BlocProvider.of<EmailBloc>(context).password,
                          builder: (context, passwordSnapshot) {
                            if (state is LoadingLoginState) {
                              return CircularProgressIndicator();
                            }
                            return RaisedButton(
                              color: Colors.blue,
                              onPressed: usernameSnapshot.hasData
                                  ? (passwordSnapshot.hasData
                                      ? () {
                                          BlocProvider.of<EmailBloc>(context)
                                              .add(
                                            LogInClickedEvent(
                                              _usernameController.text.trim(),
                                              _passwordController.text.trim(),
                                            ),
                                          );
                                        }
                                      : null)
                                  : null,
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(),
                                child: Center(
                                  child: Text(
                                    'Log in',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
