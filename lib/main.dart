import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/data_layer/repositories/authentication_repository.dart';
import 'package:poster/data_layer/services/auth_service.dart';
import 'package:poster/presentation_layer/pages/welcome_page.dart';
import 'package:poster/presentation_layer/router.dart';

import 'bloc_layer/blocs/authentication_bloc.dart';

void main() {
  // initialize firebase service
  final firebaseService = AuthenticationService();

  // initialize authentication repository
  final authenticationRepository =
      new AuthenticationRepository(firebaseService);

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: authenticationRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthenticationBloc(authenticationRepository),
          ),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Poster App',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blue,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: WelcomePage(),
      onGenerateRoute: onGenerateRoute,
    );
  }
}
