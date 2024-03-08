import 'package:coffee/data/models/category_models.dart';
import 'package:coffee/data/models/coffee_models.dart';
import 'package:coffee/utils/images/app_images.dart';


List<CoffeeModels> dataBase = [
  CoffeeModels(
      image: AppImages.coffee1,
      title: "Cappucino1",
      subtitle: "With Chocolate",
      price: 120),
  CoffeeModels(
      image: AppImages.coffee1,
      title: "Cappucino2",
      subtitle: "With Oat Milk",
      price: 120),
  CoffeeModels(
      image: AppImages.coffee1,
      title: "Cappucino3",
      subtitle: "With Chocolate",
      price: 120),
  CoffeeModels(
      image: AppImages.coffee1,
      title: "Cappucino4",
      subtitle: "With Oat Milk",
      price: 120),
];

List<CategoryModels> categoryDatabase = [
  CategoryModels(id: 1, text: "all".trim()),
  CategoryModels(id: 2, text: "mocha".trim()),
  CategoryModels(id: 3, text: "latte".trim()),
  CategoryModels(id: 4, text: "cappucino".trim()),
  CategoryModels(id: 5, text: "espresso".trim()),
];
