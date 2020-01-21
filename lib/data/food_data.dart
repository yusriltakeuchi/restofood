
import 'package:restofood/model/food.dart';

class FoodData {
  static List<Food> getFoods() {
    
    //Inisiaslisasi object food
    var _foods = new List<Food>();

    //Menambahkan data food
    _foods.add(Food(
      name: "Ayam Bakar",
      description: "Ayam bakar lezat dan pedas",
      price: 20000,
      image: "food-1.png"
    ));
    _foods.add(Food(
      name: "Sate Ayam",
      description: "Sate Ayam bumbu kacang",
      price: 15000,
      image: "food-2.png"
    ));
    _foods.add(Food(
      name: "Jus Jeruk",
      description: "Jus jeruk manis",
      price: 8000,
      image: "drink-1.png"
    ));
    _foods.add(Food(
      name: "Jus Mangga",
      description: "Jus mangga manis",
      price: 8000,
      image: "drink-2.png"
    ));

    return _foods;
  }
}