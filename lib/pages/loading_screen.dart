import 'package:flutter/material.dart';
import 'package:world_time_app/service_api/world_time.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

String screenTime = 'Loading'; // To show the time

class _LoadingScreenState extends State<LoadingScreen> {
  void setWorldTime() async {
    WorldTime countryTime = WorldTime(
        location: 'Berlin', flag: 'germany.png', locationUrl: 'Europe/Berlin');
    await countryTime.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': countryTime.location,
      'flag': countryTime.flag,
      'time': countryTime.time
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
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Text(screenTime),
      ),
    );
  }
}
