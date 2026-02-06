import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpService {

  HttpService(this.url);

  final String url;

  Future getData() async {

    http.Response responseWeather = await http.get(Uri.parse(url));

    if (responseWeather.statusCode == 200) {
      String dataWeather = responseWeather.body;
      print(dataWeather);
      var decodedData = jsonDecode(dataWeather);
      return decodedData;
    } else {
      print(responseWeather.statusCode);
    }

  }

}