import 'package:isa_new/models/ChatModel.dart';
import 'package:rxdart/rxdart.dart';

//BLoC for the dialog list

class ChatsBloc {
  final _chatsFetcher = PublishSubject<ChatModel>();

  //This method is used to pass the weather response as stream to UI
  Stream<ChatModel> get weather => _chatsFetcher.stream;

  fetchLondonWeather() async {
    //ChatModel weatherResponse = await _repository.fetchLondonWeather();
    //_weatherFetcher.sink.add(weatherResponse);
  }

  dispose() {
    //Close the weather fetcher
    //_weatherFetcher.close();
  }
}

final chats = ChatsBloc();
