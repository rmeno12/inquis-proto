import 'package:flutter/material.dart';
import 'package:inquis_proto/insights.dart';
import 'package:inquis_proto/settings_item.dart';
import 'package:inquis_proto/timeline.dart';

class SettingsPage extends StatelessWidget {
  static final bool _thing = false;
  static final List<SwitchListTile> _settings = [
    SwitchListTile(title: Text('Share Data'), onChanged: (value) => {}, value: _thing),
    SwitchListTile(title: Text('Automatic Sensor Updates'), onChanged: (value) => {}, value: _thing),
    SwitchListTile(title: Text('Super Mode'), onChanged: (value) => {}, value: _thing),
  ];

  Widget _buildBottomNavBar(BuildContext context) {
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
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => new InsightsView()
                    )
                  );
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.calendar_today),
                iconSize: 32,
                tooltip: "Timeline",
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => new TimelinePage()));
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.settings),
                iconSize: 32,
                tooltip: "Settings",
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => _settings[index],
        itemCount: _settings.length,
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }
}