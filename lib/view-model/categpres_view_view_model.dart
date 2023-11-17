import 'package:flutter/material.dart';
import 'package:untitled/API/APIManger.dart';
import 'package:untitled/model/SourcesResponce/Sorces.dart';

class CategoryDetailsViewModel extends ChangeNotifier{

  List<Source>? newSorcesList ;
  String ? erorMassage;
  bool? showLoding ;
  getSorceses(String categoryId)async{
    showLoding = true;
    erorMassage = null ;
    newSorcesList = null;
    notifyListeners();


   try{
     var responce =  await ApiManger.getSorces(categoryId);
     showLoding = false ;
     if(responce.status == 'error'){
       return erorMassage = responce.message;
     }else{
       newSorcesList = responce.sources ;
     }
   }catch(e){
     showLoding = false ;

     erorMassage= e.toString();
   }
       notifyListeners();
  }
}