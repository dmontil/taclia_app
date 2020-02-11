import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:taclia_app/src/provider/event_logic.dart';
import '../bloc.dart';

class EventBloc extends Bloc<EventBlocEvent, EventState> {
  EventBloc({@required this.eventLogic});
  final EventLogic eventLogic;
  @override
  EventState get initialState => InitialEventState();

  @override
  Stream<EventState> mapEventToState(
    EventBlocEvent event,
  ) async* {
    if( event is getDataEvent){
      yield EventinInBlocState();
      try{
        var responseData = await eventLogic.getEvents();
        yield EventedInBlocState(responseData);
      }on EventException{
        print("Error in call");
      }

    }
    // TODO: Add Logic
  }
}
