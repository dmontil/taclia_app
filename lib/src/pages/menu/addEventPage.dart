import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taclia_app/src/blocs/bloc.dart';
import 'package:taclia_app/src/provider/event_logic.dart';

import 'calendarPage.dart';

class AddEventPage extends StatefulWidget {
  @override
  _AddEventPageState createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  EventBloc _eventBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _eventBloc = EventBloc(eventLogic: EventLogic());
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _eventBloc,
    child: BlocListener<EventBloc, EventState>(
    listener: (context, state) {
    if (state is EventedInBlocState) {
    }
    },
    child: BlocBuilder<EventBloc, EventState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Añadir evento"),
  
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CalendarPage()));
              },
            )
          ],
        ),
        body: Container(
          child: Column(children: <Widget>[
            Row(children: <Widget>[

            ],),
            Row(children: <Widget>[

            ],),   Row(children: <Widget>[

            ],),   Row(children: <Widget>[

            ],)
          ],),
        ),
      );
    }
    )));
  }
}
