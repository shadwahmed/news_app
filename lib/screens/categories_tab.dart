import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/widgets/CategoryItem.dart';

class CategoriesTab extends StatelessWidget {
  Function onClick;
   CategoriesTab({required this.onClick,super.key});
  @override
  Widget build(BuildContext context) {
    var categories = CategoryModel.getCategories();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Text(
          "Pick your category of interest",textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                onClick(categories[index]);
                },
                child: CategoryItem(
                  model: categories[index],
                  index: index,
                ),
              );
            },
            itemCount: categories.length,
          ),
        )
      ]),
    );
  }
}
