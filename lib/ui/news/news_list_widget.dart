import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/model/SourcesResponce/Sorces.dart';
import 'package:untitled/ui/news/details/new_deliles.dart';
import 'package:untitled/ui/news/post_widget.dart';
import 'package:untitled/view-model/news_list_view_model.dart';
class NewsListWidget extends StatefulWidget {
  NewsListWidget(this.source, {Key? key}) : super(key: key);
  Source source;
  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}
class _NewsListWidgetState extends State<NewsListWidget> {
  var viewModel = NewsListViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.getNews(widget.source.id??'');
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context)=> viewModel,
      child: Consumer<NewsListViewModel>(
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
              viewModel.getNews(widget.source.id??'');
            },
              child: const Text('Try Again'),
            ),
          ],
        );
      }
      else
      {
        var newList = viewModel.newsList;
               return  ListView.builder(
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
    );
  }
}