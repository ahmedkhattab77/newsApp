import 'package:flutter/material.dart';
import 'package:untitled/model/NewsResponce/News.dart';
import 'package:untitled/ui/news/details/details_widget.dart';
import 'package:untitled/ui/news/post_widget.dart';

class NewDetails extends StatelessWidget {
  static const routeName = 'newDetails';


  @override

  Widget build(BuildContext context) {
    News news =  ModalRoute.of(context)!.settings.arguments as News;
    return  Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pattern.png'),
          ),
          color: Colors.white),
      child: Scaffold(
        appBar:  AppBar(
      title: const Text('News App'),
    ),
                 body: DetailsWidget(
                   news,
                 ),
      ),
    );
  }
}
