import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/data/home_data.dart';
import 'package:untitled/ui/category_details/sources_tab.dart';
import 'package:untitled/view-model/categpres_view_view_model.dart';

class CotegoryDetails extends StatefulWidget {
  CotegoryDetails({this.categories, Key? key}) : super(key: key);
  Categories? categories;

  @override
  State<CotegoryDetails> createState() => _CotegoryDetailsState();
}

class _CotegoryDetailsState extends State<CotegoryDetails> {
  var viewModel = CategoryDetailsViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSorceses(widget.categories!.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<CategoryDetailsViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.showLoding == true)
          {
            return Center(child: CircularProgressIndicator());
          }
          else if (viewModel.erorMassage != null)
          {
            return Column(
              children: [
                Text(
                  viewModel.erorMassage ?? '',
                ),
                ElevatedButton(
                  onPressed: () {
                    viewModel.getSorceses(widget.categories!.id);
                  },
                  child: const Text('Try Again'),
                ),
              ],
            );
          }
          else
          {
            var sourceList = viewModel.newSorcesList;
            return SourcesTab(
              sources: sourceList!,
            );
          }
        },
      ),
    );
  }
}
