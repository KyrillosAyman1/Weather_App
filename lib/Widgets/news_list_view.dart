
import 'package:flutter/material.dart';
import 'package:news_app/Models/articles_model.dart';

import 'package:news_app/Widgets/news_tile.dart';



class NewsListView extends StatelessWidget {
   const NewsListView({super.key,required this.articles});
 final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      
      delegate: SliverChildBuilderDelegate(childCount: articles.length, (
        context,
        index,
        
      ) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: NewsTile(articleModel: articles[index]),
        );
      }),
    );
  }
}
