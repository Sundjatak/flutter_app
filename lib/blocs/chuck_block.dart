import 'dart:async';
import '../networking/Response.dart';
import '../repository/chuck_repository.dart';
import '../models/chuckResponse.dart';

class ChuckBloc {
  ChuckRepository _chuckRepository;
  StreamController _chuckDataController;

  StreamSink<Response<chuckResponse>> get chuckDataSink =>
    _chuckDataController.sink;
  
  Stream<Response<chuckResponse>> get chuckDataStream =>
    _chuckDataController.stream;

  ChuckBloc(String category) {
    _chuckDataController = StreamController<Response<chuckResponse>>();
    _chuckRepository = ChuckRepository();
    fetchChuckJoke(category);
  }

  fetchChuckJoke(String category) async {
    chuckDataSink.add(Response.loading('Getting a Chucky Joke.'));
    try {
      chuckResponse chuckJoke = await _chuckRepository.fetchChuckJoke(category);
      chuckDataSink.add(Response.completed(chuckJoke));
    } catch (e) {
      chuckDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }  
  dispose() {
    _chuckDataController?.close();
  }
}