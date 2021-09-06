import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    loc();
    super.initState();
  }

  void loc() async{
    WeatherModel ww=WeatherModel(context);
    var data=await ww.getLocationWeather();
    
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(data);
    }));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitChasingDots(
          color: Colors.cyan,
          size: 50,
        ),
      ),
    );
  }

}
