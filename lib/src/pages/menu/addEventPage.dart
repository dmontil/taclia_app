import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taclia_app/src/blocs/bloc.dart';
import 'package:taclia_app/src/models/events.dart';
import 'package:taclia_app/src/provider/event_logic.dart';

import 'calendarPage.dart';

class AddEventPage extends StatefulWidget {
  @override
  _AddEventPageState createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  EventBloc _eventBloc;
  TextEditingController titleController;
  TextEditingController dateController;
  TextEditingController tagController;
  TextEditingController descriptionlController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController = TextEditingController();
    dateController = TextEditingController();
    tagController = TextEditingController();
    descriptionlController = TextEditingController();
    _eventBloc = EventBloc(eventLogic: EventLogic());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => _eventBloc,
        child: BlocListener<EventBloc, EventState>(listener: (context, state) {
          if (state is EventUploadBlocState) {
            if (state.isUploaded)
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CalendarPage()));
          }
        }, child: BlocBuilder<EventBloc, EventState>(builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text("Añadir evento"),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.save),
                  onPressed: () {
                    _saveEvent(Events(
                        title: titleController.text,
                        date: dateController.text,
                        description: descriptionlController.text,
                        tag: tagController.text));
                  },
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: Form(),
              ),
            ),
          );
        })));
  }

  Widget Form() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        rowInput("Titulo", titleController),
        rowInput("Fecha: dd/mm/yyyy", dateController),
        rowInput("Etiqueta", tagController),
        rowInput("Desripción", descriptionlController)
      ],
    );
  }

  Widget rowInput(String title, TextEditingController controller) {
    return Row(
      children: <Widget>[
        Flexible(
          child: TextField(
            controller: controller,
            decoration: decoration(title),
          ),
        ),
      ],
    );
  }

  InputDecoration decoration(String title) {
    return InputDecoration(
        labelStyle: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        border:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        hintText: title);
  }

  _saveEvent(Events event) {
    _eventBloc.add(uploadEvent(event));
  }
}
