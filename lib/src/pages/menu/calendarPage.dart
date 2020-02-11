import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taclia_app/src/blocs/bloc.dart';
import 'package:taclia_app/src/models/events.dart';
import 'package:taclia_app/src/provider/event_logic.dart';
import 'package:taclia_app/src/widgets/widgets.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  EventBloc _eventBloc;
  List<Events> list;
  @override
  void initState() {
    super.initState();
    _eventBloc = EventBloc(eventLogic: EventLogic());
    _getEvents();
    list = List<Events>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => _eventBloc,
        child: BlocListener<EventBloc, EventState>(
          listener: (context, state) {
            if (state is EventedInBlocState) {
              list = state.list;
            }
          },
          child: BlocBuilder<EventBloc, EventState>(builder: (context, state) {
            return Scaffold(
                appBar: AppBar(
                  title: Text("Calendar"),
                  leading: IconButton(
                      icon: Icon(Icons.power_settings_new), onPressed: () {}),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: (){
                        Navigator.pushNamed(context, "addEvent");
                      },
                    )
                  ],
                ),
                backgroundColor: Colors.white,
                body: list != null
                    ? Container(
                        child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: list.length,
                        itemBuilder: (context, i) =>
                            WidgetsCustoms().cardList(list[i]),
                      ))
                    : Center(
                        child: CircularProgressIndicator(),
                      ));
          }),
        ));
  }

  _getEvents() {
    _eventBloc.add(getDataEvent());
  }

  _createEvent() {

  }
}
