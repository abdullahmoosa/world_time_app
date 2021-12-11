// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:world_time_app/service_api/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

int counter = 0;

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(locationUrl: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(
        locationUrl: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(
        locationUrl: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(
        locationUrl: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(
        locationUrl: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(
        locationUrl: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(
        locationUrl: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(
        locationUrl: 'Asia/Jakarta',
        location: 'Jakarta',
        flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Build state run');
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text(
          'Choose a Location',
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) => Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
            child: ListTile(
              onTap: () {
                updateTime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
