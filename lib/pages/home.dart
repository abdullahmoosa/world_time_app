// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
//import 'package:world_time_app/pages/choosing_location.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map dataLoadingScreen = {};

  @override
  Widget build(BuildContext context) {
    dataLoadingScreen = dataLoadingScreen.isNotEmpty
        ? dataLoadingScreen
        : ModalRoute.of(context)!.settings.arguments as Map;
    //print(dataLoadingScreen);

    String bgImage = dataLoadingScreen['isDayTime']
        ? 'assets/day.jpg'
        : 'assets/night_2.jpg';

    Color? bgColor =
        dataLoadingScreen['isDayTime'] ? Colors.green[50] : Colors.blue[900];

    Color? textColor =
        dataLoadingScreen['isDayTime'] ? Colors.redAccent[300] : Colors.white;

    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('$bgImage'),
              fit: BoxFit.cover,
            )),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 180, 0, 0),
              child: Column(
                children: <Widget>[
                  TextButton.icon(
                      onPressed: () async {
                        dynamic result = await Navigator.pushNamed(
                            context, '/choosing_location');
                        setState(() {
                          dataLoadingScreen = {
                            'time': result['time'],
                            'location': result['location'],
                            'isDayTime': result['isDayTime'],
                            'flag': result['flag'],
                          };
                        });
                      },
                      icon: Icon(
                        Icons.edit_location,
                        color: Colors.deepPurple[800],
                      ),
                      label: Text(
                        'Choose Location',
                        style: TextStyle(
                            fontSize: 25.0,
                            color: textColor,
                            fontFamily: 'Oxygen'),
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
                          color: textColor,
                          fontSize: 30.0,
                          letterSpacing: 2.0,
                          fontFamily: 'Oxygen',
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
                        color: textColor,
                        fontSize: 50.0,
                        letterSpacing: 2.0,
                        fontFamily: 'Oxygen'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
