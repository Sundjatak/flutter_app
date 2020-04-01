import 'dart:async';
import '../networking/Response.dart';
import '../repository/chuck_category_repository.dart';
import '../models/chuckCategories.dart';

class ChuckCategoryBloc {
  ChuckCategoryRepository _chuckRepository;
  StreamController _chuckListConstroller;


  StreamSink<Response<chuckCategories>> get chuckListSink =>
    _chuckListConstroller.sink;

  Stream<Response<chuckCategories>> get chuckListStream =>
    _chuckListConstroller.stream;

  ChuckCategoryBloc() {
    _chuckListConstroller = StreamController<Response<chuckCategories>>();
    _chuckRepository = ChuckCategoryRepository();
    fetchCategories();

  }

  fetchCategories() async {
    chuckListSink.add(Response.loading('Getting Chuck Categories.'));
    try {
      chuckCategories chuckCats = 
        await _chuckRepository.fetchChuckCategoryData();
      chuckListSink.add(Response.completed(chuckCats));
    } catch (e){
      chuckListSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose(){
    _chuckListConstroller?.close();
  }

}