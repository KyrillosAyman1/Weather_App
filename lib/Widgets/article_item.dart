import 'package:flutter/material.dart';
import 'package:news_app/Models/articles_model.dart';
import 'package:news_app/Views/artical_web_view.dart';

class ArticleItem extends StatefulWidget {
  const ArticleItem({super.key, required this.articleModel});
  final ArticleModel articleModel;

  @override
  State<ArticleItem> createState() => _ArticleItemState();
}

class _ArticleItemState extends State<ArticleItem> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(10),
            child: Image.network(
              widget.articleModel.image ??
                  "https://arabcodeweek2022.alecso.org/competition/activities/f25/13e8/19h7di01iibe8i6g.jpeg",
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  "assets/news.jpg", // ضع هنا صورة بديلة من المشروع
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),

          SizedBox(height: 8),

          Text(
            widget.articleModel.title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),

          Text(
            widget.articleModel.subtitle ?? "",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(),
          Center(
            child: Text(
              widget.articleModel.source ?? "",
              style: TextStyle(
                color: Colors.orange,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
            ),
          ),
          Center(
            child: Text(
        "${widget.articleModel.published.year}-${widget.articleModel.published.month}-${widget.articleModel.published.day}",
              style: TextStyle(
                color: Color.fromARGB(255, 39, 39, 39),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: IconButton(
              icon: Icon(
                size: 35,
                widget.articleModel.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: Colors.red,
              ),
              onPressed: () {
                setState(() {
                  widget.articleModel.isFavorite =
                      !widget.articleModel.isFavorite;
                });
              },
            ),
          ),

          Divider(),

          Text(
            widget.articleModel.content,
            style: TextStyle(
              color: Color.fromARGB(255, 80, 78, 78),
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ArticleWebView(url: widget.articleModel.url),
                  ),
                );
              },

              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: Text(
                "Read More",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
