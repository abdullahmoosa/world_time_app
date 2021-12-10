// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:world_time_app/pages/choosing_location.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map dataLoadingScreen = {};

  @override
  Widget build(BuildContext context) {
    dataLoadingScreen = ModalRoute.of(context)!.settings.arguments as Map;
    print(dataLoadingScreen);

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 120, 0, 0),
        child: Column(
          children: <Widget>[
            TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/choosing_location');
                },
                icon: Icon(Icons.edit_location),
                label: Text(
                  'Choose Location',
                  style: TextStyle(fontSize: 25.0),
                )),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  dataLoadingScreen['location'],
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 25.0,
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              dataLoadingScreen['time'],
              style: TextStyle(
                color: Colors.blueGrey[900],
                fontSize: 25.0,
                letterSpacing: 2.0,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
