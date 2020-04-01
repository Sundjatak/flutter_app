import '../networking/ApiProvider.dart';
import 'dart:async';
import '../models/chuckCategories.dart';

class ChuckCategoryRepository {
  ApiProvider _provider = ApiProvider();

  Future<chuckCategories> fetchChuckCategoryData() async {
    final response = await _provider.get("/jokes/categories");
    print(response);
    return chuckCategories.fromJsonMap(response);
  }
}