import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_bug/logics/logics.dart';
import 'package:travel_bug/logics/main_bloc.dart';

import 'screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MainBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => ChangeNotifierProvider(
              create: (_) => LoginBloc(), child: LoginScreen()),
          '/userData': (context) => ChangeNotifierProvider(
              create: (_) => UserDataBloc(), child: UserDataScreen()),
          '/home': (context) => ChangeNotifierProvider(
              create: (_) => HomeBloc(), child: HomeScreen()),
          // '/landing' :(context) => LandingScreen(),
        },
      ),
    );
  }
}
