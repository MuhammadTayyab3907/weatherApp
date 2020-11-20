import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;

  double longitude;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
    //getData();
  }

  void getLocationData() async {
   WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData,);
    }));
    //getData();
  }

  /* void getData() async {
    http.Response response = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    if (response.statusCode == 200) {
      String data = response.body;

      var decodeData = jsonDecode(data);
      //var longitude = json.decode(data)['coord']['lon'];
      //var weatherDescription = json.decode(data)['weather'][0]['description'];
      double  temperature = decodeData['main']['temp'];
      int condition = decodeData['weather'][0]['id'];
      String cityName = decodeData['name'];
      print(temperature);
      print(condition);
      print(cityName);
    } else {
      print(response.statusCode);
    }
  }
*/
  @override
  Widget build(BuildContext context) {
    //getData();
    return Scaffold(
      body: Center(
     child: SpinKitFadingCircle(
       color: Colors.white,
       size: 50.0,
     ),
      ),
    );
  }
}
