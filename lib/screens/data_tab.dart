import 'package:flutter/material.dart';

import '../shared/network/remote/api_manager.dart';
import 'news_tab.dart';

class DataTab extends StatelessWidget {
  String categoryID;
   DataTab({required this.categoryID,super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(categoryID),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if(snapshot.hasError){
          return Center(child: Text("Something went wrong"));
        }
        var sourceList = snapshot.data?.sources ?? [];
        return NewsTab(sources: sourceList);
      },
    );
  }
}
