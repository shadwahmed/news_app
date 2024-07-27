import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/NewsDataModel.dart';
import 'package:news_app/models/SourceResponse.dart';
import 'package:news_app/shared/components/constants.dart';
import 'package:news_app/shared/network/remote/endPoints.dart';
import 'package:news_app/shared/styles/app_strings.dart';

class ApiManager {
  static Future<SourceResponse> getSources(String categoryID) async {
    Uri url = Uri.https(
        Constants.BASE_URL,
        EndPoints.sources,
        {"category":categoryID,
        AppString.apikey: Constants.API_KEY});

    http.Response response = await http.get(url);
    Map<String, dynamic> json = jsonDecode(response.body);
    return SourceResponse.fromJson(json);
  }

  static Future<NewsDataModel> getNewsData(String sourceId) async {
    Uri url = Uri.https(Constants.BASE_URL, EndPoints.newsData, {
      AppString.apikey: Constants.API_KEY,
      "sources": sourceId,
    });
    http.Response response = await http.get(
      url,
    );
    var json = jsonDecode(response.body);
    return NewsDataModel.fromJson(json);
  }
}
