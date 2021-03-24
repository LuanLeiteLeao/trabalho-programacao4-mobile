import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mercado/model.dart';

const baseUrl = "http://localhost:8080/crudGamesBackEnd/api?casoDeUso=";

class API {
  static Future getFilmes() {
    var url = baseUrl + "ManterFilme";
    return http.get(url);
  }
  static Future postFilmes(Filme filme) {
    var url = baseUrl + "ManterFilme";
    var body = json.encode(filme.toJson());
   
    print(filme.toJson());  
    return http.post(url,
      headers: {"Content-Type": "application/json"},
      body: body);
  }
}