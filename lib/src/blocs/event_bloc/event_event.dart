import 'package:equatable/equatable.dart';

abstract class EventBlocEvent extends Equatable {
  const EventBlocEvent();
}
//functions

class getDataEvent extends EventBlocEvent{
  getDataEvent();
  @override
  List<Object> get props => [];

}
