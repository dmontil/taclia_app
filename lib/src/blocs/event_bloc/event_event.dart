import 'package:equatable/equatable.dart';
import 'package:taclia_app/src/models/events.dart';

abstract class EventBlocEvent extends Equatable {
  const EventBlocEvent();
}
//functions

class getDataEvent extends EventBlocEvent{
  getDataEvent();
  @override
  List<Object> get props => [];

}

class uploadEvent extends EventBlocEvent{
  final Events event;
  uploadEvent(this.event);
  @override
  // TODO: implement props
  List<Object> get props => [event];

}

class deleteEvent extends EventBlocEvent{
  final String id;
  deleteEvent(this.id);
  @override
  List<Object> get props => [id];

}
