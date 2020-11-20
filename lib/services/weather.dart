
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '9f5413a45ec96fee1628e5288e763a4c';


class WeatherModel {

  Future<dynamic> getWeatherCity(String cityName) async
  {
    var url = 'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData() ;
    print(weatherData);
    return weatherData ;
  }

  Future<dynamic> getLocationWeather()async
  {
    Location location = Location();
    await location.getCurretLocation();
    //latitude = location.latitude;
    //longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey');
    var weatherData = await networkHelper.getData();
    return weatherData ;
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

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
