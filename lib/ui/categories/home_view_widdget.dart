import 'package:flutter/material.dart';
import 'package:untitled/data/home_data.dart';

class CategoryViewWidgget extends StatelessWidget {
   CategoryViewWidgget({Key? key,
   required this.index,
     required this.data
  }) : super(key: key);
 int index;
Categories data ;
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
      color: data.color,
          borderRadius: BorderRadius.only(
          topRight: const Radius.circular(16),
              topLeft: const Radius.circular(16),
            bottomLeft: index.isEven ?const Radius.circular(16):
              const Radius.circular(0),
            bottomRight:  index.isOdd ?const Radius.circular(16):
            const Radius.circular(0),
      )
    ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(data.image),
          Text(data.title,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
          )
        ],
      ),
    );
  }
}
