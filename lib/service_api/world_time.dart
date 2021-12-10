import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  late String location; // location name for the UI
  late String time; // time of the location
  late String flag; // url to asset the respective flag
  late String locationUrl; // api endpoint URl indicating current location
  late String date; // current date

  WorldTime(
      {required this.location, required this.flag, required this.locationUrl});

  Future<void> getTime() async {
    try {
      Response response = await get(
          Uri.parse(('http://worldtimeapi.org/api/timezone/$locationUrl')));
      Map jsonData = jsonDecode(response.body);
      //print(jsonData['timezone']);
      //print(jsonData);

      // get properties

      String dateTime = jsonData['datetime'];
      //String offset = jsonData['utc_offset'];
      //print(dateTime);
      print(dateTime);
      date = dateTime.substring(0, 10);
      time = dateTime.substring(11, 19);
      //print(dateTime);
      //print(offset);
      //print(time);

    } catch (e) {
      time = "Could not get time";
    }
  }
}
