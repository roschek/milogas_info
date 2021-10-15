import 'package:flutter/material.dart';
import 'package:milongas_info/pages/main_page.dart';
import 'package:milongas_info/services/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'domains/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return const ErrorWidget();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamProvider<LocalUser?>.value(
            value: AuthService().currentUser,
            initialData: null,
            catchError: (_, __) => null,
            child: const MaterialApp(
                title: 'Milongas info',
                home: MainPage()
            ),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return const Loading();
      },
    );
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: const [
              Text('Something wrong')
            ],
          ),
        ),
      ),
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: const [
              CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}