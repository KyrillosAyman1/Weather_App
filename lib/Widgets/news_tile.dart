import 'package:flutter/material.dart';
import 'package:news_app/Models/articles_model.dart';
import 'package:news_app/Views/article_view.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsTile extends StatefulWidget {
  const NewsTile({super.key, required this.articleModel});
  final ArticleModel articleModel;

  @override
  State<NewsTile> createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return ArticleView(article: widget.articleModel);
              },
            ),
          );
        },
        child: Card(
          elevation: 6,
          shadowColor: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl:
                          widget.articleModel.image ??
                          "https://img.freepik.com/free-vector/realistic-news-studio-background_23-2149985612.jpg",
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Image.asset(
                        "assets/news1.jpg",
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  widget.articleModel.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  widget.articleModel.subtitle ?? "",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Divider(height: 1),
                SizedBox(
                  height: 35,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.articleModel.published ?? "",
                          style: TextStyle(
                            color: Color.fromARGB(255, 39, 39, 39),
                            fontSize: 10,
                          ),
                        ),
                      ),

                      Expanded(
                        child: Text(
                          widget.articleModel.source ?? "",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 39, 39, 39),
                            fontSize: 12,
                          ),
                          maxLines: 1,
                        ),
                      ),

                      IconButton(
                        icon: Icon(
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*
Image.network(
                    widget.articleModel.image ??
                        "https://img.freepik.com/free-vector/realistic-news-studio-background_23-2149985612.jpg",
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        "assets/news.jpg", 
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      );
                    },
                  ),*/
