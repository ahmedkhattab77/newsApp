import 'package:flutter/material.dart';
import 'package:untitled/model/SourcesResponce/Sorces.dart';

class SourceTabWidget extends StatelessWidget {
   SourceTabWidget(this.source,this.isCelected,{Key? key}) : super(key: key);
Source source;
bool isCelected =false ;
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: isCelected ?
        Theme.of(context).colorScheme.primary:
        Colors.transparent,
        border: Border.all(color:Theme.of(context).colorScheme.primary,
        width: 4)
      ),
      child: Text(
        source.name??'',
        style: TextStyle(

            color: isCelected ?
            Colors.white:
            Theme.of(context).colorScheme.primary,
        fontSize: 20),
      ),
    );
  }
}
