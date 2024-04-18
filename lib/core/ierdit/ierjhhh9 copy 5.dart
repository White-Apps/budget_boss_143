import 'package:flutter/material.dart';

class EventsCalendaavjkasnvas extends StatefulWidget {
  @override
  _EventsCalendaavjkasnvasState createState() => _EventsCalendaavjkasnvasState();
}

class _EventsCalendaavjkasnvasState extends State<EventsCalendaavjkasnvas> {
  List<String> events = ['Event 1', 'Event 2', 'Event 3'];

  void addEventToCalendar(String eventName) {
    setState(() {
      events.add(eventName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Events Calendar')),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(events[index]));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addEventToCalendar('New Event'),
        child: Icon(Icons.add),
      ),
    );
  }
}
