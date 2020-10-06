import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart'as http;

Future<Map> getWeather(String appKey,String city)async{
  String urlAPI ='http://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${appKey}&units=metric';
  http.Response response = await http.get(urlAPI);

  if(response.statusCode == 200){
    return json.decode(response.body);
  }else{
    throw Exception("API call has failed");
  }
}

Future<Map> getToday(String appKey,String city)async{
  String urlAPI ='http://api.openweathermap.org/data/2.5/forecast?q=${city}&appid=${appKey}&units=metric';
  http.Response response = await http.get(urlAPI);

  if(response.statusCode == 200){
    return json.decode(response.body);
  }else{
    throw Exception("API call has failed");
  }
}