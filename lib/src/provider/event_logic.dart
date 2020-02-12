import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taclia_app/src/models/events.dart';

class EventException implements Exception {}

class EventLogic {
  final _fireStore = Firestore.instance;

  bool saveEvent(Events event) {
    var dataSend = _fireStore.collection("Events").add({
      'title': event.title,
      'description': event.description,
      'date': event.date,
      'tag': event.tag,
    });
    if (dataSend != null) return true;
  }

  bool deleteEvent(String id) {
    var eventDelete = _fireStore.collection("Events").document(id).delete();
    if (eventDelete != null) return true;
  }

  Future<List<Events>> getEvents() async {
    List<Events> list = List<Events>();
    var events = await _fireStore.collection("Events").getDocuments();

    for (var event in events.documents) {
      Events eventTemp = Events.fromJson(event.data);
      eventTemp.id = event.documentID;
      list.add(eventTemp);
    }
    return list;
  }
}
