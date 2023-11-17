import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:untitled/model/NewsResponce/NewsResponce.dart';
import 'package:untitled/model/SourcesResponce/SourcesResponce.dart';

class ApiManger{
  static const baseUrl = 'newsapi.org';
  static const  apiKey = 'b85aaf438c7f4c7fb59cbed78424b51f';
  static Future<SorcesResponce> getSorces(String categoryId)async{
    var url = Uri.https(baseUrl,'v2/top-headlines/sources',{
     "apiKey":apiKey,
      "category":categoryId,
    });
    var responce= await http.get(url);
    var json = jsonDecode(responce.body);
    var sorcesResponce = SorcesResponce.fromJson(json);
    return sorcesResponce ;
  }
  static Future<NewsResponce> getNews(String sourceId)async{
    var url = Uri.https(baseUrl, 'v2/everything',{
      "apiKey":apiKey,
      "sources":sourceId,
    });
    var responce= await http.get(url);
    var json = jsonDecode(responce.body);
    var newsresponce = NewsResponce.fromJson(json);
    return newsresponce ;
  }
  static Future<NewsResponce> search(String search)async{
    var url = Uri.https(baseUrl, 'v2/everything',{
      "apiKey":apiKey,
      "q":search,
    });

    var responce= await http.get(url);
    var json = jsonDecode(responce.body);
    var newsresponce = NewsResponce.fromJson(json);
    return newsresponce ;
  }
}