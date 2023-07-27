import 'package:geolocator/geolocator.dart';

/// 获取位置坐标
class Location{
  double latitude=0.0;
  double longitude=0.0;

  Future<void> getCurrentLocation() async{
    try{
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude=position.altitude;
      longitude=position.longitude;
    }catch(e){
      print(e);
    }
  }
}