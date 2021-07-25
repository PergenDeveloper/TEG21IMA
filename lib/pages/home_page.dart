import 'package:eglimpia/components/event_preview.dart';
import 'package:eglimpia/components/incident_preview.dart';
import 'package:eglimpia/constants/colors.dart';
import 'package:eglimpia/data/events.dart';
import 'package:eglimpia/pages/create_event.dart';
import 'package:eglimpia/utils/commons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                _headerText(),
                SizedBox(height: 20),
                _recentEvents(),
                SizedBox(height: 30),
                _recentIncidents()
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        hoverElevation: 0,
        elevation: 2.0,
        onPressed: () async {
          final option = await showActionsDialog(context);
          print(option);
          if (option != null) {
            if (option == 1) {
              _navigateToCreateEvent();
            } else {
              // TODO create incident
            }
          }
        },
        child: const Icon(
          Icons.add,
          size: 35,
        ),
        backgroundColor: ColorsTheme.primary,
      ),
    );
  }

  void _navigateToCreateEvent() {
    Navigator.push(
      context,
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (context) => CreateEvent(),
      ),
    ).then((value) {
      if (value != null) {
        setState(() {
          events.insert(0, value);
          showSuccessMessage(context, "Se ha creado la campaña.");
        });
      }
    });
  }

  Widget _headerText() {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Text(
        "Inicio",
        style: TextStyle(
          color: ColorsTheme.primary,
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _recentEvents() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            "Campañas recientes",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 220,
          child: ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            children: events
                .map<Widget>((event) => EventPreview(event: event))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _recentIncidents() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            "Incidencias recientes",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 220,
          child: ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              IncidentPreview(
                image: 'images/1.jpeg',
                text: 'Contenedor roto y con basura',
              ),
              IncidentPreview(
                image: 'images/2.jpeg',
                text: 'Papelera repleta de basura',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
