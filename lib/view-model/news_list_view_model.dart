import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:untitled/API/APIManger.dart';
import '../model/NewsResponce/News.dart';

class NewsListViewModel extends ChangeNotifier{
  List<News>? newsList;
  String ? erorMassage;
  bool? showLoding ;
    getNews(String sourceId)async{
      showLoding = true ;
      erorMassage = null ;
      newsList = null ;
      notifyListeners();
      try{
        var responce = await ApiManger.getNews(sourceId);
        showLoding = null ;
        if(responce.status == 'error'){
          return erorMassage = responce.message;
        }else{
          newsList = responce.articles ;
        }
      }catch(e,stack){
        showLoding = null ;
        erorMassage= e.toString();
        print(stack);
        if(e is SocketException){

          erorMassage= 'check the InterNet';
      }



      }
      notifyListeners();
    }
}