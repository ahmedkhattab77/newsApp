import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/ui/search/textField_widget.dart';
import 'package:untitled/view-model/search_view_model.dart';

import '../news/details/new_deliles.dart';
import '../news/post_widget.dart';

class SearchView extends StatelessWidget {

  static const routeName = 'search';
   SearchView({Key? key}) : super(key: key);

  var viewModel = SearchViewModel();
   TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pattern.png'),
          ),
          color: Colors.white),
      child: Scaffold(
        appBar: AppBar(
            toolbarHeight: 70,
          title: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.white
            ),
            child: CustomTextField(

              hintText: 'Search',
              icon: Icon(Icons.search),
              onChanged: (value){
                if(value!.isNotEmpty ){
                  viewModel.getSearch(value.toString()??'');
                  search.text =value! ;
                }
                return ;

              },
              controller: search,),
          ),
        ),
        body: search.text.isEmpty?
        Container() :
        ChangeNotifierProvider(
          create: (context)=> viewModel,
               child: Consumer<SearchViewModel>(
               builder: (context, viewModel, child){
            if (viewModel.showLoding == true)
            {
              return const Center(
                  child: CircularProgressIndicator()
              );
            }
            else  if (viewModel.erorMassage != null)
            {
              return Column(
                children: [
                  Text(
                    viewModel.erorMassage?? '',
                  ),
                  ElevatedButton(onPressed: (){
                    viewModel.getSearch(search.toString()??'');
                  },
                    child: const Text('Try Again'),
                  ),
                ],
              );
            }
            else
            {
              var newList = viewModel.newsList??[];
              return newList==[]? Container(): ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed(NewDetails.routeName,
                        arguments:newList[index],
                      );
                    },
                    child: PostWidget(
                      newList[index],
                    ),
                  );
                },
                itemCount: newList!.length,
              );
            }
          }
      ),
    )
      ),
    );
  }
}
