import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  void initState(){
    super.initState();
    getLocationDate();
  }

  void getLocationDate() async {

    // WeatherModel weather=WeatherModel();
    var weatherData=await WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: weatherData,);
    }));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
/// https://api.openweathermap.org/data/2.5/weather?
/// lat=5&lon=-122.084&appid=57449927884df6c69513b9646bcbbb6b
/// 河南科技学院 35.2813, 113.9371
