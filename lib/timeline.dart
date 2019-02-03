import 'package:flutter/material.dart';
import 'package:inquis_proto/insights.dart';
import 'package:inquis_proto/settings.dart';
import 'package:inquis_proto/timeline_entry.dart';
import 'package:inquis_proto/new_entry.dart';
//import 'package:inquis_proto/timeline_viewer.dart';

class TimelinePage extends StatefulWidget {
  @override
  State createState() => new TimelinePageState();
}

class TimelinePageState extends State<TimelinePage> {
  static final List<TimelineEntry> entries = <TimelineEntry>[];
  int _selectedIndex = 0;
//  static final timelineViewer = new TimelineViewer();
//  static final settingsPage = new SettingsPage();
//  final _widgetOptions = [
//    timelineViewer,
//    settingsPage
//  ];

  Widget _buildAppBar() {
    return new AppBar(
      title: Text(
        'Timeline',
        style: TextStyle(fontSize: 28),
      ),
      leading: Container(
        padding: EdgeInsets.fromLTRB(4, 4, 0, 4),
        child: Image.asset(
          'assets/inquis_icon.png',
          width: 1.0,
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return new BottomAppBar(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: IconButton(
                icon: Icon(Icons.show_chart),
                iconSize: 32,
                tooltip: "Insights",
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => new InsightsView()));
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.calendar_today),
                iconSize: 32,
                tooltip: "Timeline",
                onPressed: () {},
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.settings),
                iconSize: 32,
                tooltip: "Settings",
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => new SettingsPage()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return new FloatingActionButton(
      onPressed: _openNewEntryDialog,
      child: Icon(
        Icons.add,
        size: 32,
      ),
      tooltip: 'New Entry',
    );
  }

  static Widget _buildTimelineView() {
    return Container(
      padding: EdgeInsets.all(0.0),
      child: ListView.builder(
        padding: EdgeInsets.all(8),
        itemBuilder: (context, index) => entries[index],
        itemCount: entries.length,
      ),
    );
  }

  void _addEntry(TimelineEntry newEntry) {
    setState(() {
      entries.insert(0, newEntry);
    });
  }

  Future _openNewEntryDialog() async {
    TimelineEntry newEntry =
        await Navigator.of(context).push(new MaterialPageRoute<TimelineEntry>(
      builder: (BuildContext context) {
        return new NewEntryDialog();
      },
      fullscreenDialog: true,
    ));
    if (newEntry != null) {
      _addEntry(newEntry);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Center(
        child: _buildTimelineView(),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }
}
