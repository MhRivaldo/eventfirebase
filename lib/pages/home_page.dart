import 'package:flutter/material.dart';
import '../utils/colours.dart';
import 'add_event_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  ///Navigates to the Add Event Page
  void addEvent() {
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (context) {
          var addEventPage = new AddEventPage();
          return addEventPage;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: new FloatingActionButton(
        onPressed: () => addEvent(),
        //backgroundColor: Colors.amberAccent,
        child: new Icon(Icons.add),
      ),
      body: new Material(
        color: AppColours.primaryCharcoalDark,

        // Get all events ordered by start time
        child: new StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance
              .collection('events')
              .orderBy("start-time")
              .snapshots,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) return new Text("Loading...");
            return new ListView(
              children:
                  snapshot.data.documents.map((DocumentSnapshot document) {
                return new EventCard(document['name'], document['description'],
                    document.documentID);
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
