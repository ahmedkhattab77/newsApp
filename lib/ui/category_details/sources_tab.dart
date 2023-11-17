import 'package:flutter/material.dart';
import 'package:untitled/ui/category_details/source_tab_widget.dart';
import 'package:untitled/ui/news/news_list_widget.dart';

import '../../model/SourcesResponce/Sorces.dart';

class SourcesTab extends StatefulWidget {
  SourcesTab({Key? key, required this.sources}) : super(key: key);
  List<Source> sources;

  @override
  State<SourcesTab> createState() => _SourcesTabState();
}

class _SourcesTabState extends State<SourcesTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources.length,
      child: Column(
        children: [
          TabBar(
              onTap: (newIndex) {
                selectedIndex = newIndex;
                setState(() {});
              },
              isScrollable: true,
              indicatorColor: Colors.transparent,
              tabs: widget.sources
                  .map((source) => SourceTabWidget(
                        source,
                        widget.sources.indexOf(source) == selectedIndex
                            ? true
                            : false,
                      ))
                  .toList()),
          Expanded(
            child: NewsListWidget(
              widget.sources[selectedIndex],
            ),
          ),
        ],
      ),
    );
  }
}
