import 'package:http/http.dart' as http;
import 'dart:convert';
class NetworkHelper
{
  final String url ;

  NetworkHelper(this.url);

  Future getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;

      var decodeData = jsonDecode(data);
      //var longitude = json.decode(data)['coord']['lon'];
      //var weatherDescription = json.decode(data)['weather'][0]['description'];
      //double  temperature = decodeData['main']['temp'];
      int condition = decodeData['weather'][0]['id'];
      String cityName = decodeData['name'];
      //print(temperature);
      //print(condition);
      //print(cityName);
      return decodeData ;
    } else {
      print(response.statusCode);
    }
  }
}