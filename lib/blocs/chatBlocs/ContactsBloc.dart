import 'package:isa_new/models/ChatContactModel.dart';
import 'package:rxdart/rxdart.dart';

class ContactsBloc {
  List<ChatContactsModel> _contacts;

  final _contactFetcher = PublishSubject<List<ChatContactsModel>>();

  Stream<List<ChatContactsModel>> get news => _contactFetcher.stream;

  void fetchContacts() {
    _contactFetcher.sink.add(_contacts);
  }

  fetchNews() async {
    //TODO call api with globals.API
    _contacts = [
      ChatContactsModel.fromJson({
        "uid": 12,
        "username": "Артём Смирнов",
        "active": true,
        "last_online": "13:06",
        "asset":
            "https://wl-brightside.cf.tsp.li/resize/728x/jpg/f6e/ef6/b5b68253409b796f61f6ecd1f1.jpg"
      }),
      ChatContactsModel.fromJson({
        "uid": 12,
        "username": "Артём Смирнов",
        "active": false,
        "last_online": "13:06",
        "asset":
            "https://wl-brightside.cf.tsp.li/resize/728x/jpg/f6e/ef6/b5b68253409b796f61f6ecd1f1.jpg"
      }),
      ChatContactsModel.fromJson({
        "uid": 12,
        "username": "Артём Смирнов",
        "active": true,
        "last_online": "13:06",
        "asset":
            "https://wl-brightside.cf.tsp.li/resize/728x/jpg/f6e/ef6/b5b68253409b796f61f6ecd1f1.jpg"
      })
    ];
    _contactFetcher.sink.add(_contacts);
  }

  dispose() {
    _contactFetcher.close();
  }
}

final contactsBloc = ContactsBloc();
