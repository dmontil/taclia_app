import 'package:equatable/equatable.dart';
import 'package:taclia_app/src/models/events.dart';

abstract class EventState extends Equatable {
  const EventState();
}

class InitialEventState extends EventState {
  @override
  List<Object> get props => [];
}

class EventinInBlocState extends EventState{
  @override
  List<Object> get props => [];
}
class EventedInBlocState extends EventState{
  final List<Events> list;
  EventedInBlocState(this.list);
  @override
  List<Object> get props => [list];

}

