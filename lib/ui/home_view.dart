import 'package:flutter/material.dart';
import 'package:untitled/data/home_data.dart';
import 'package:untitled/ui/drawer/drawer.dart';
import 'package:untitled/ui/search/searsh_view.dart';
import 'package:untitled/ui/settings/settingsFragment.dart';
import 'categories/categoriesFragment.dart';
import 'category_details/category_details.dart';

class HomeView extends StatefulWidget {

  static const routeName = 'homeView';
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setectedFragment = CategoriesFragment(onCategoryItemClick);
  }
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pattern.png'),
          ),
          color: Colors.white),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('News App'),
          actions:  [
            IconButton(onPressed: (){
              Navigator.of(context).pushNamed(SearchView.routeName);
            }, icon: Icon(Icons.search))
          ],
        ),


        drawer: MyDrawer(onMenuItemClick: onMenuItemClicked,),
        body: setectedFragment,
      ),
    );
  }

 late  Widget setectedFragment;

 void onMenuItemClicked (MenuItem item){
   Navigator.pop(context);
   switch(item){
     case MenuItem.categories :{
       setectedFragment = CategoriesFragment(onCategoryItemClick);
     }
     case MenuItem.settings :{
       setectedFragment = SettingsFragment();
     }

   }
   setState(() {

   });
 }
 void onCategoryItemClick(Categories categories){
   setectedFragment =CotegoryDetails(categories:categories,);
   setState(() {

   });
 }

}
