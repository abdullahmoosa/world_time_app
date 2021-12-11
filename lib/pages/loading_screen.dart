// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:world_time_app/service_api/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

String screenTime = 'Loading'; // To show the time

class _LoadingScreenState extends State<LoadingScreen> {
  void setWorldTime() async {
    WorldTime countryTime = WorldTime(
        location: 'Dhaka', flag: 'bangladesh.png', locationUrl: 'Asia/Dhaka');
    await countryTime.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': countryTime.location,
      'flag': countryTime.flag,
      'time': countryTime.time,
      'isDayTime': countryTime.isDayTime
    });

    setState(() {
      screenTime = countryTime.time;
    });
    //print(countryTime.time);
  }

  @override
  void initState() {
    super.initState();
    setWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[800],
        body: Center(
          child: SpinKitFadingCube(
            color: Colors.white,
            size: 80.0,
          ),
        ));
  }
}
