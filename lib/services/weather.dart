import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const openWeatherUrl ='https://api.openweathermap.org/data/2.5/weather';
const apiKey='57449927884df6c69513b9646bcbbb6b';
class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async{
    var url='$openWeatherUrl?q=$cityName&appid=$apiKey&units=metric';
    NetWorkHelper netWorkHelper=NetWorkHelper();
    var weatherData=await netWorkHelper.getCityData(openWeatherUrl, cityName, apiKey);
    return weatherData;
  }


  Future<dynamic> getLocationWeather() async {
    double latitude=0.0,longitude=0.0;

    Location location=Location();
    await location.getCurrentLocation();
    /// 收到位置坐标
    /// 因获取到的位置不是新乡，先注释
    // latitude=location.latitude;
    // longitude=location.longitude;
    latitude=35.2815;
    longitude=113.9356;

    NetWorkHelper netWorkHelper=NetWorkHelper();
    var weatherData= await netWorkHelper.getData(openWeatherUrl,latitude,longitude,apiKey);
    // print(weatherData);
    return weatherData;
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
