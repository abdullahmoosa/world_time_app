import 'package:flutter/material.dart';
import 'package:world_time_app/pages/choosing_location.dart';

import 'package:world_time_app/pages/home.dart';
import 'package:world_time_app/pages/loading_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      highlightColor: Colors.blue[900],
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => LoadingScreen(),
      '/home': (context) => Home(),
      '/choosing_location': (context) => ChooseLocation()
    },
  ));
}
