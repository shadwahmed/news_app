import 'package:flutter/material.dart';
import 'package:news_app/models/SourceResponse.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';

import 'widgets/news_item.dart';
import 'widgets/source_item.dart';

class NewsTab extends StatefulWidget {
  NewsTab({required this.sources, super.key});
  List<Sources> sources;

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
                isScrollable: true,
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                onTap: (value) {
                  selectedIndex = value;
                  setState(() {});
                },
                tabs: widget.sources
                    .map((e) => Tab(
                          child: SourceItem(
                            source: e,
                            selected:
                                widget.sources.elementAt(selectedIndex) == e,
                          ),
                        ))
                    .toList())),
        FutureBuilder(
            future:
                ApiManager.getNewsData(widget.sources[selectedIndex].id ?? ""),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text("Something went wrong"));
              }
              var articles = snapshot.data?.articles ?? [];
              return Expanded(
                child: ListView.separated(
                  separatorBuilder: (context,index)=>SizedBox(
                    height: 10,
                  ),
                  itemBuilder: (context, index) {
                    return NewsItem(article: articles[index]);
                  },
                  itemCount: articles.length,
                ),
              );
            })
      ],
    );
  }
}
