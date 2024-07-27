import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/categories_tab.dart';
import 'package:news_app/screens/data_tab.dart';
import 'package:news_app/screens/news_tab.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';

import '../screens/drawer_tab.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  static const String routeName = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image:
              DecorationImage(image: AssetImage("assets/images/pattern.png"))),
      child: Scaffold(
        drawer: DrawerTab(
          onClick: onDrawerClicked,
        ),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.green,
          centerTitle: true,
          shape: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(18),
              bottomLeft: Radius.circular(18),
            ),
          ),
          title: Text(
            categoryModel == null ? "News" : categoryModel!.tittle,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        body: categoryModel == null
            ? CategoriesTab(
                onClick: onCategoryClicked,
              )
            : DataTab(
                categoryID: categoryModel!.id,
              ),
      ),
    );
  }

  CategoryModel? categoryModel;

  onCategoryClicked(catModel) {
    categoryModel = catModel;
    setState(() {});
  }

  onDrawerClicked(val) {
    if (val == DrawerTab.CATEGORY_ID) {
      categoryModel = null;
      Navigator.pop(context);
      setState(() {});
    } else if (val == DrawerTab.SETTINGS_ID) {}
  }
}
