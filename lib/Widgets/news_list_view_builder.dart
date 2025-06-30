import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Models/articles_model.dart';
import 'package:news_app/Services/news_services.dart';

import 'package:news_app/Widgets/news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.category});
  final String category;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = NewsServices(Dio()).getNews(category: widget.category);
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListView(articles: snapshot.data!);
        } else if (snapshot.hasError) {
          return SliverFillRemaining(
            child: Text("opps!!!! there are an error, try later.."),
          );
        } else {
          return SliverFillRemaining(
            child: Center(child: LinearProgressIndicator()),
          );
        }
      },
    );
  }
}
