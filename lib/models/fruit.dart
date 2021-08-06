import 'dart:collection';

class Nutritions {
  //contructor
  Nutritions({
    this.calories = 0.0,
    this.carbohydrates = 0.0,
    this.fat = 0.0,
    this.protein = 0.0,
    this.sugar = 0.0,
  });

  Nutritions.fromJson(Map<String, dynamic> json)
      : this.calories = json['calories'] + .0,
        this.carbohydrates = json['carbohydrates'] + .0,
        this.fat = json['fat'] + .0,
        this.protein = json['protein'] + .0,
        this.sugar = json['sugar'] + .0;

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

  Fruit.fromJson(Map<String, dynamic> json)
      : this.genus = json['genus'],
        this.family = json['family'],
        this.name = json['name'],
        this.order = json['order'],
        this.id = json['id'],
        this.nutritions = Nutritions.fromJson(json['nutritions']);

  String genus;
  String name;
  int id;
  String family;
  String order;
  Nutritions nutritions;
}
