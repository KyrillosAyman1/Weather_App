import 'package:dio/dio.dart';
import 'package:news_app/Models/articles_model.dart';

class NewsServices {
  final Dio dio;

  NewsServices(this.dio);

  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
      final response = await dio.get(
        
        //"https://newsapi.org/v2/top-headlines?apiKey=5bbfbc9edaca45418bcf406aee35f04e&country=us&category=$category",
        'https://gnews.io/api/v4/top-headlines?category=$category&apikey=4a7160675c41c38359c9d8ebc1c39261&country=eg&lang=ar#',
        //'https://gnews.io/api/v4/top-headlines?category=$category&apikey=c7a9ec8fee95f5a379ed5cff4cf68559&country=eg&lang=ar#',
      );

      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData["articles"];

      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        ArticleModel articleModel = ArticleModel.fromjson(article);
        articlesList.add(articleModel);
      }

      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
