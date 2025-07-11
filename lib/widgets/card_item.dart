import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.name, required this.data});
  final String name;
  final String data;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
     width: MediaQuery.of(context).size.width * 0.45,
      child: Card(
        color: Color.fromARGB(255, 251, 202, 167).withAlpha(
          (0.8 * 255).round(),
        ), // 0.0 = شفاف تمامًا، 1.0 = معتم تمامًا
        elevation: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              
            ),
            SizedBox(height:6,),
            Text(
              data,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 82, 56, 38),),
            ),
          ],
        ),
      ),
    );
  }
}
