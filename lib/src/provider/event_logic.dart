

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taclia_app/src/models/events.dart';

class EventException implements Exception {}

class EventLogic{
  final _fireStore = Firestore.instance;

  void saveEvent(Events event){
    _fireStore.collection("Events").add({
      'title' : event.title,
      'description' : event.description,
      'date' : event.date,
      'tag' : event.tag,
    });
  }
  void deleteEvent(Events event){

  }

  Future<List<Events>> getEvents() async{
    List<Events> list  = List<Events>();
    var events = await _fireStore.collection("Events").getDocuments();

    for( var event in events.documents){

      Events eventTemp = Events.fromJson(event.data);
      list.add(eventTemp);

    }
    return list;


  }

}