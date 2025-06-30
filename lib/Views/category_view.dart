
import 'package:flutter/material.dart';
import 'package:news_app/Widgets/news_list_view_builder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category, required this.categoryTitle});
  final String category;
  final String categoryTitle;
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
              category[0].toUpperCase()+category.substring(1).toLowerCase(),
              style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Spacer(),
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
        child: CustomScrollView(
          slivers: [NewsListViewBuilder(category: category)],
        ),
      ),
    );
  }
}
