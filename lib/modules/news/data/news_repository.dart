import 'package:get/get.dart';
import 'package:news_app/network/network_client.dart';
import 'package:news_app/utils/api_end_point.dart';

import '../domain/error_model.dart';
import '../domain/news_model.dart';

class NewsRepository{
  NetworkClient networkClient=NetworkClient();

  NewsRepository(this.networkClient);

  Future<NewsModel> newsGetRepository() async {
    try {
      var queryParams = {
        "q": "tesla",
        "from": "2023-09-01",
        "sortBy": "publishedAt",
        "apiKey": API.NEWS_EVERYTHING,
      };
      Response response =
      await networkClient.getRequest(query: queryParams);
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        print(response.body);
        return NewsModel.fromJson(response.body);
      }
    } catch (e) {
      return Future.error(ErrorModel(message: e.toString()));
    }
  }

}