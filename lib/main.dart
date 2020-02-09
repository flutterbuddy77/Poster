import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/bloc_layer/google_bloc.dart';
import 'package:poster/data_layer/repositories/google_sign_in_repository.dart';
import 'package:poster/data_layer/repositories/mail_repository.dart';
import 'package:poster/data_layer/services/auth_service.dart';
import 'package:poster/presentation_layer/pages/welcome_page.dart';
import 'package:poster/presentation_layer/router.dart';
import 'bloc_layer/blocs/email_login_bloc.dart';

void main() {
  // initialize firebase service
  final firebaseService = AuthenticationService();

  // initialize mail repository
  final mailRepository = new MailRepository(firebaseService);
  // initialize google sign in repository
  final googleSignInRepository = new GoogleSignInRepository(firebaseService);

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: mailRepository,
        ),
        RepositoryProvider.value(
          value: googleSignInRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => EmailBloc(mailRepository),
          ),
          BlocProvider(
            create: (_) => GoogleBloc(googleSignInRepository),
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
