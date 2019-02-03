import 'package:flutter/material.dart';
import 'package:inquis_proto/settings.dart';
import 'package:inquis_proto/timeline.dart';

class InsightsView extends StatefulWidget {
  @override
  InsightsViewState createState() => new InsightsViewState();
}

class InsightsViewState extends State<InsightsView> {
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
                onPressed: () {},
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.calendar_today),
                iconSize: 32,
                tooltip: "Timeline",
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => new TimelinePage()));
                },
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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insights'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

          Image.asset('assets/hoursofsleep.png', height: 300,),
            //Icon(Icons.show_chart, size: 300,),
            SizedBox(height: 40,),
            Container(
              padding: EdgeInsets.all(24),
              child: Text(
                'Your sleep habits are healthy',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.green[900]
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }
}
