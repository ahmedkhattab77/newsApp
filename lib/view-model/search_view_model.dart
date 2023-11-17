import 'package:untitled/API/APIManger.dart';
import '../model/NewsResponce/News.dart';
import 'package:flutter/foundation.dart';


class SearchViewModel extends ChangeNotifier{
  List<News>? newsList;
  String ? erorMassage;
  bool? showLoding ;
  getSearch(String search)async{
    showLoding = true ;
    erorMassage = null ;
    newsList = null ;
    notifyListeners();
    try{
      var responce = await ApiManger.search(search);
      showLoding = null ;
      if(responce.status == 'error'){
        return erorMassage = responce.message;
      }else{
        newsList = responce.articles ;
      }
    }catch(e){
      showLoding = null ;
      erorMassage= e.toString();
    }
    notifyListeners();
  }
}