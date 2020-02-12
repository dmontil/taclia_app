import 'package:equatable/equatable.dart';
import 'package:taclia_app/src/models/events.dart';

abstract class EventState extends Equatable {
  const EventState();
}
//Initial state
class InitialEventState extends EventState {
  @override
  List<Object> get props => [];
}
//While the function is running
class EventinInBlocState extends EventState{
  @override
  List<Object> get props => [];
}
//When an event is uploaded
class EventUploadBlocState extends EventState{
  final bool isUploaded;
  EventUploadBlocState(this.isUploaded);
  @override
  List<Object> get props => [isUploaded];
}
// When delete event
class EventDeleteBlocState extends EventState{
  final bool isDelete;
  EventDeleteBlocState(this.isDelete);
  @override
  List<Object> get props => [isDelete];

}

// When the result has arrived
class EventedInBlocState extends EventState{
  final List<Events> list;
  EventedInBlocState(this.list);
  @override
  List<Object> get props => [list];

}

