import 'package:flutter/material.dart';

import '../../../data/home_data.dart';
import 'home_view_widdget.dart';

typedef OnCategoryClick = void Function(Categories categories);
class CategoriesFragment extends StatelessWidget {

  CategoriesFragment(this.onCategoryClick,{super.key});
OnCategoryClick onCategoryClick ;
  List<Categories> categories = Categories.getAllCategories();
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(12.0),

      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Pick your Categories \n of insert ',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),),
          const SizedBox(height: 10,),
          Expanded(

            child: GridView.count(
              mainAxisSpacing: 24,
              crossAxisSpacing: 24,
              crossAxisCount: 2,
              children: List.generate(
                categories.length,
                    (index) => InkWell(
                      onTap: (){
                        onCategoryClick(categories[index]);
                      },
                      child: CategoryViewWidgget(
                  index: index,
                  data: categories[index],
                ),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
