import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:flutter_app/http_exception.dart';

Future<Map> getWeather(String appKey,String city)async{
  String urlAPI ='http://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${appKey}&units=metric';
  http.Response response = await http.get(urlAPI);

  if(response.statusCode == 200){
    // print('GET WEATHER: ' + response.body + '\n');
    return json.decode(response.body);
  }else{
    HTTPException exc = new HTTPException(response.statusCode, response.body);
    print(exc);
    throw Exception("API call has failed: " + exc.toString());
  }
}