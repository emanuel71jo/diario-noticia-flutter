
import 'dart:convert';

import 'package:diario_noticias/noticia.dart';
import 'package:http/http.dart' as http;

class Api {

  List<String> _categoria = ["principal","business","entertainment","health","science","sports","technology"];


  Future<List<Noticia>> search({String search, int indexCategory}) async{

    http.Response response;
    if(indexCategory == null) response = await http.get("https://newsapi.org/v2/top-headlines?country=br&apiKey=4fefa03107a6436799aed33261b1b638&q=${search}");
    else if(indexCategory == 0) response = await http.get("https://newsapi.org/v2/top-headlines?country=br&apiKey=4fefa03107a6436799aed33261b1b638");
    else response = await http.get("https://newsapi.org/v2/top-headlines?country=br&category=${_categoria[indexCategory]}&apiKey=4fefa03107a6436799aed33261b1b638");


    return decode(response);
  }

  List<Noticia> decode(http.Response response){
    if(response.statusCode == 200){
      var decoded = json.decode(response.body);

      List<Noticia> noticias = [];

      for(dynamic noticia in decoded["articles"]){
        noticias.add(Noticia.fromJson(noticia));
      }

     return noticias;

    }else{
      throw Exception("Failed to load news");
    }
  }


}