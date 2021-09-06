import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/cupertino.dart';

const ApiKey='8e111c2f92042f5ed692ee68644fe1fe';
const url1='https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  BuildContext context;
  WeatherModel(this.context);
  Future<dynamic> getCityWeather(String city) async{
    NetworkHelper n2=NetworkHelper('$url1?q=$city&appid=$ApiKey&units=metric');
    var dd2 = await n2.getdata(context);
    return dd2;
  }

  Future<dynamic> getLocationWeather() async{
    Location loca=Location();
    await loca.getCurrentLocation();

    NetworkHelper n1=NetworkHelper('$url1?lat=${loca.lat}&lon=${loca.long}&appid=$ApiKey&units=metric');
      try {
        var dd1 = await n1.getdata(context);
        return dd1;
      }
      catch(e){
        print(e);
        print('hello');

      }
      }


  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp,int condition) {
    if(condition<600 || condition>800){
      return 'Bring a 🧥 just in case';
    }else if (temp > 25) {
      return 'It\'s Hot';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    }else if (temp > 10) {
      return 'It\s pleasant outside' ;
    }else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    }
  }
}
