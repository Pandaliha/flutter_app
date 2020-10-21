import 'dart:async';
import 'package:http/http.dart'as http;
import 'package:flutter_app/http_exception.dart';
import 'package:xml/xml.dart' as xml;
import 'package:flutter_app/pages/books/book_model.dart';

Future<List> getBooks(String appKey, String searchterm, int page, String field) async {
  String urlAPI ='https://www.goodreads.com/search/index.xml?key=$appKey&q=$searchterm&page=$page&search[field]=$field';
  http.Response response = await http.get(urlAPI);
  var document = xml.parse(response.body);

  if(response.statusCode == 200){
    var searchResults = document.findAllElements('best_book');
    List<Book> bookList = searchResults.map((book) {
      return Book(
        title: book.findElements('title').first.text,
        author: book
            .findElements('author')
            .first
            .findElements('name')
            .first
            .text,
        imageUrl: book.findElements('image_url').first.text,
      );
    }).toList();

    return bookList;
  } else{
    HTTPException exc = new HTTPException(response.statusCode, response.body);
    print(exc);
    throw Exception("API call has failed: " + exc.toString());
  }
}

