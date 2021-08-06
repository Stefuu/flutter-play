import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pocblah/models/fruit.dart';

Future<String> getFruitResponse() async {
  var url = Uri.parse("https://www.fruityvice.com/api/fruit/all");
  var response = await http.get(url);
  return response.body;
}

Future<List<Fruit>> getFruitList() async {
  var response = await getFruitResponse();
  var resApi = json.decode(response);
  var fruitList = List<Fruit>.from(resApi);
  return fruitList;
}
