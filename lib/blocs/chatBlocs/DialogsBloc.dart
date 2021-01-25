import 'package:isa_new/models/chatModels/ChatModel.dart';
import 'package:rxdart/rxdart.dart';

class DialogsBloc {
  List<ChatModel> _dialogs;

  DialogsBloc() {}

  final _newsFetcher = PublishSubject<List<ChatModel>>();

  Stream<List<ChatModel>> get dialogs => _newsFetcher.stream;

  fetchNews() async {
    //TODO call api with globals.API

    _dialogs = [
      ChatModel.fromJson({
        "username": "Артём Смирнов",
        "lastMsg": "Представляешь, не ожидал что стану супер крутым",
        "lastMsgTime": "11:50",
        "readed": true,
        "last_online": "был(а) в 17:06",
        "userImg":
            "https://wl-brightside.cf.tsp.li/resize/728x/jpg/f6e/ef6/b5b68253409b796f61f6ecd1f1.jpg",
      }),
      ChatModel.fromJson({
        "username": "Артём Смирнов",
        "lastMsg": "Представляешь, не ожидал что стану супер крутым",
        "lastMsgTime": "11:50",
        "readed": true,
        "last_online": "был(а) в 17:06",
        "userImg":
        "https://wl-brightside.cf.tsp.li/resize/728x/jpg/f6e/ef6/b5b68253409b796f61f6ecd1f1.jpg",
      }),
      ChatModel.fromJson({
        "username": "Артём Смирнов",
        "lastMsg": "Представляешь, не ожидал что стану супер крутым",
        "lastMsgTime": "11:50",
        "readed": true,
        "last_online": "был(а) в 17:06",
        "userImg":
        "https://wl-brightside.cf.tsp.li/resize/728x/jpg/f6e/ef6/b5b68253409b796f61f6ecd1f1.jpg",
      }),
    ];

    _newsFetcher.sink.add(_dialogs);
  }

  dispose() {
    _newsFetcher.close();
  }
}

final dialogsBlocc = DialogsBloc();
