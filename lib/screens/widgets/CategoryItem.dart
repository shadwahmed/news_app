import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';

class CategoryItem extends StatelessWidget {

  CategoryModel model;
  int index;

  CategoryItem({required this.index, required this.model, super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: model.color,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
          bottomLeft: index.isOdd?Radius.circular(25):Radius.circular(0),
          bottomRight: index.isEven?Radius.circular(25):Radius.circular(0),
        )
      ),
      child: Column(
        children: [
          Expanded(child: Image.asset(model.image)),
          Text(
            model.tittle,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
