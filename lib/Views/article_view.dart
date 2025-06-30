import 'package:flutter/material.dart';
import 'package:news_app/Models/articles_model.dart';
import 'package:news_app/Widgets/article_item.dart';



class ArticleView extends StatelessWidget {
  const ArticleView({super.key, required this.article,});
   final ArticleModel article;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 221, 243, 255),
      appBar: AppBar(
        foregroundColor: Colors.blueGrey,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Color.fromARGB(255, 221, 243, 255),

        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           
            
            Text(
              "News",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Text(
              "Cloud",
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView( // بدل CustomScrollView لأننا نعرض عنصر واحد
          physics: BouncingScrollPhysics(),
          child:  ArticleItem(articleModel: article),
      ),
    ));
  }
}
