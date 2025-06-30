import 'package:flutter/material.dart';
import 'package:news_app/Models/category_model.dart';
import 'package:news_app/Widgets/category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  final List<CategoryModel> categories = const [
    CategoryModel(categoryName: "Business", image: "assets/buisness2.jpg"),
    CategoryModel(categoryName: "Technology", image: "assets/technology.jpeg"),
    CategoryModel(categoryName: "Health", image: "assets/health.avif"),
    CategoryModel(categoryName: "Sports", image: "assets/sports.avif"),
    CategoryModel(categoryName: "Science", image: "assets/science.avif"),
    CategoryModel(categoryName: "Entertainment", image: "assets/entertaiment.avif"),
    CategoryModel(categoryName: "World", image: "assets/world.png"),
    CategoryModel(categoryName: "Nation", image: "assets/nation.png"),
    CategoryModel(categoryName: "General", image: "assets/general.avif"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(categoryModel: categories[index]);
        },
      ),
    );
  }
}
