import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Views/home_view.dart';



void main() {
  
  runApp(
    
    const NewsApp());
}

final dio = Dio();

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomeView(),
    );
  }
}
