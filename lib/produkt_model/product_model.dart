class CoffeeModels {
  final String image;
  final String title;
  final String subtitle;
  final String price;
  final int count;

  CoffeeModels({
    required this.title,
    required this.image,
    required this.subtitle,
    required this.count,
    required this.price,
  });
}

// CoffeeModels coffeeModels = CoffeeModels(
// image: dataBase[index].image,
// title: dataBase[index].title,
// subtitle: dataBase[index].subtitle,
// price: dataBase[index].price,
// count: dataBase[index].count,
