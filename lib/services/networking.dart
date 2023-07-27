import 'dart:convert';

import 'package:http/http.dart' as http;

class NetWorkHelper{


  Future getData(openWeatherUrl,latitude,longitude,apiKey) async{
    /// get() 参数为 Uri 格式，需要将字符串转化为 Uri 格式
    /// Uri uri = Uri.parse(url);
    /// units=metric 将开尔文温度转为摄氏度
    http.Response respons=await http.get(Uri.parse('$openWeatherUrl?'
        'lat=$latitude&lon=$longitude&appid=$apiKey&units=metric'));
    if(respons.statusCode==200){
      String data=respons.body;

      /// jsonDecode是一个用于解析JSON字符串的Dart函数。它将一个JSON字符串作为输入，
      /// 并返回一个对应的Dart对象，该对象表示了该JSON字符串的结构和数据。
      var decodedData=jsonDecode(data);

      return decodedData;
    }else{
      print(respons.statusCode);
    }
  }

  Future getCityData(openWeatherUrl,cityNmae,apiKey) async{
    /// get() 参数为 Uri 格式，需要将字符串转化为 Uri 格式
    /// Uri uri = Uri.parse(url);
    /// units=metric 将开尔文温度转为摄氏度
    http.Response respons=await http.get(Uri.parse('$openWeatherUrl?'
        'q=$cityNmae&appid=$apiKey&units=metric'));
    if(respons.statusCode==200){
      String data=respons.body;

      /// jsonDecode是一个用于解析JSON字符串的Dart函数。它将一个JSON字符串作为输入，
      /// 并返回一个对应的Dart对象，该对象表示了该JSON字符串的结构和数据。
      var decodedData=jsonDecode(data);

      return decodedData;
    }else{
      print(respons.statusCode);
    }
  }
}