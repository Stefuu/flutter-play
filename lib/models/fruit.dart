class Nutritions {
  //contructor
  Nutritions({
    this.calories = 0.0,
    this.carbohydrates = 0.0,
    this.fat = 0.0,
    this.protein = 0.0,
    this.sugar = 0.0,
  });

  double carbohydrates;
  double protein;
  double fat;
  double calories;
  double sugar;
}

class Fruit {
  Fruit({
    this.genus = "",
    this.family = "",
    this.name = "",
    this.order = "",
    required this.id,
    required this.nutritions,
  });

  String genus;
  String name;
  int id;
  String family;
  String order;
  Nutritions nutritions;
}
