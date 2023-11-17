import 'package:flutter/material.dart';

class Categories{
  String id ;
  String image;
  String title;
  Color color;
  Categories({
    required this.title,
    required this.image,
    required this.color,
    required this.id,
  });
  static List<Categories> getAllCategories(){
    return [
      Categories(image: 'assets/images/ball.png',
        id: 'sports',
        title: 'Sports',
        color: Color(0xffC91C22),
      ),
      Categories(image: 'assets/images/Politics.png',
        id: 'general',
        title: 'General',
        color: Color(0xff003E90),
      ),
      Categories(image: 'assets/images/health.png',
        title: 'Health',
        id: 'health',
        color: Color(0xffED1E79),
      ),
      Categories(image: 'assets/images/bussines.png',
        title: 'Business',
        id: 'business',
        color: Color(0xffCF7E48),
      ),
      Categories(image: 'assets/images/environment.png',
        title: 'Enviroment',
        id: 'entertainment',
        color: Color(0xff4882CF),
      ),
      Categories(image: 'assets/images/science.png',
        title: 'Science',
        id: 'science',
        color: Color(0xffF2D352),
      )
    ];
  }
}