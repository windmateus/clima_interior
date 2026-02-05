import 'package:clima_interior/services/networking.dart';

const apiKey = 'SUA_API_KEY';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class Clima {

  Future<dynamic> getClimaLocalidade(double latitude, double longitude) async {
    NetworkHelper networkHelper = NetworkHelper('$openWeatherMapURL?lat=${latitude}&lon=${longitude}&appid=$apiKey&units=metric');

    var climaData = await networkHelper.getData();
    return climaData;
  }

  String getIcone(int condition) {
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

}