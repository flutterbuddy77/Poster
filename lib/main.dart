import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/data_layer/repositories/mail_repository.dart';
import 'package:poster/data_layer/services/firebase_service.dart';
import 'package:poster/presentation_layer/pages/login_page.dart';
import 'package:poster/presentation_layer/pages/welcome_page.dart';
import 'package:poster/presentation_layer/router.dart';
import 'bloc_layer/blocs/login_bloc.dart';

void main() {
  // initialize firebase service
  final firebaseService = FirebaseService();
  // initialize mail repository
  final mailRepository = MailRepository(firebaseService);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => EmailBloc(mailRepository),
          child: LoginPage(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
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
