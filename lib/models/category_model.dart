import 'dart:ui';

class CategoryModel {
  String id;
  String tittle;
  String image;
  Color color;

  CategoryModel(this.id, this.tittle, this.image, this.color);

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(
          "sports", "Sports", "assets/images/sports.png", Color(0xffC91C22),
      ),
      CategoryModel(
        "general", "Politics", "assets/images/Politics.png", Color(0xff003E90),
      ),
      CategoryModel(
        "health", "Health", "assets/images/health.png", Color(0xffED1E79),
      ),
      CategoryModel(
        "business", "Business", "assets/images/bussines.png", Color(0xffCF7E48),
      ),
      CategoryModel(
        "entertainment", "Environment", "assets/images/environment.png", Color(0xff4882CF),
      ),
      CategoryModel(
        "science", "Science", "assets/images/science.png", Color(0xffF2D352),
      ),






    ];
  }
}
