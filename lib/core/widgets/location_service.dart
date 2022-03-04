import 'package:geolocator/geolocator.dart';

class LocationService {
  static Future<String> determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return "0,0";
      }
    }
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position.latitude.toString() + "," + position.longitude.toString();
  }
}
