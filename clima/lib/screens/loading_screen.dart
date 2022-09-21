import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/Location.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
    getData();
  }

  void getLocation() async {
    print('pressed');
    Location location = Location();
    location.getCurrentLocation();
    //print(position);
  }

  void getData() async {
    double longitude;
    double latitude;
    Location location = Location();
    latitude = location.getLatitude();
    longitude = location.getLongitude();

    Response response = await get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?lat=44.34&lon=10.99&appid=970b044b235762e719343872e7839150'));

    if (response.statusCode == 200) {
      String data = response.body;
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    String myMargin = '15';
    try {
      double myMarginAsADouble = double.parse(myMargin);
      return Scaffold(
        body: Container(
          margin: EdgeInsets.all(double.parse(myMargin)),
          color: Colors.red,
        ),
      );
    } catch (e) {
      print(e);
      return Scaffold(
        body: Container(
          margin: EdgeInsets.all(30),
          color: Colors.black,
        ),
      );
    }
  }
}
