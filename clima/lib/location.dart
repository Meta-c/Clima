import 'package:geolocator/geolocator.dart';

class Location {
  double longitude = 0;
  double latitude = 0;

  void getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.lowest);

      longitude = position.longitude;
      latitude = position.latitude;
      print(position.longitude);
      print(position.latitude);
    } catch (e) {
      print(e);
    }

    //return 'Longitude : $longitude       Latitude : $latitude  ';
  }

  double getLatitude() {
    return latitude;
  }

  double getLongitude() {
    return longitude;
  }
}
