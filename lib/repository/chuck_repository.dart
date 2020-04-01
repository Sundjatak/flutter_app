import '../networking/ApiProvider.dart';
import '../models/chuckResponse.dart';
import 'dart:async';

class ChuckRepository {
  ApiProvider _provider = ApiProvider();

  Future<chuckResponse> fetchChuckJoke(String category) async {
    final response = await _provider.get( "jokes/random?category=" + category );
    return chuckResponse.fromJsonMap(response);
  }
}