import 'package:geolocator/geolocator.dart';

class Location
{
  double lat;
  double long;

  Future<void> getCurrentLocation() async
  {
      LocationPermission permi;
      try {
        Position pos = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
        lat = pos.latitude;
        long = pos.longitude;
      }
       catch (e) {
         print(e);
         permi = await Geolocator.checkPermission();
         if (permi == LocationPermission.denied) {
           permi = await Geolocator.requestPermission();
           if (permi == LocationPermission.denied) {
             // Permissions are denied, next time you could try
             // requesting permissions again (this is also where
             // Android's shouldShowRequestPermissionRationale
             // returned true. According to Android guidelines
             // your App should show an explanatory UI now.
             return Future.error('Location permissions are denied');
           }
         }
         if (permi == LocationPermission.deniedForever) {
           // Permissions are denied forever, handle appropriately.
           return Future.error(
               'Location permissions are permanently denied, we cannot request permissions.');
         }
       }
  }
}