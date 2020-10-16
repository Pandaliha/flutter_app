import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:flutter_app/http_exception.dart';

Future<Map> getBooks(String appKey, String searchterm, int page)async {
  String urlAPI ='https://www.goodreads.com/search/index.xml?key=${appKey}&q=${searchterm}&page=${page}';
  http.Response response = await http.get(urlAPI);

  if(response.statusCode == 200){
    return json.decode(response.body);
  }else{
    HTTPException exc = new HTTPException(response.statusCode, response.body);
    print(exc);
    throw Exception("API call has failed: " + exc.toString());
  }
}

Future<Map> getBooksByAuthor(String appKey, String searchterm, int page) async {
  String urlAPI ='https://www.goodreads.com/search/index.xml?key=${appKey}&q=${searchterm}&page=${page}&search[author]';
  http.Response response = await http.get(urlAPI);

  if(response.statusCode == 200){
    return json.decode(response.body);
  }else{
    HTTPException exc = new HTTPException(response.statusCode, response.body);
    print(exc);
    throw Exception("API call has failed: " + exc.toString());
  }
}

Future<Map> getBooksByTitle(String appKey, String searchterm, int page)async {
  String urlAPI ='https://www.goodreads.com/search/index.xml?key=${appKey}&q=${searchterm}&page=${page}&search[title]';
  http.Response response = await http.get(urlAPI);

  if(response.statusCode == 200){
    return json.decode(response.body);
  }else{
    HTTPException exc = new HTTPException(response.statusCode, response.body);
    print(exc);
    throw Exception("API call has failed: " + exc.toString());
  }
}