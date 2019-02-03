import 'package:flutter/material.dart';
import 'package:inquis_proto/timeline.dart';
import 'package:inquis_proto/timeline_entry.dart';

class NewEntryDialog extends StatefulWidget {
  @override
  NewEntryDialogState createState() => new NewEntryDialogState();
}

class NewEntryDialogState extends State<NewEntryDialog> {
  final DateTime _dateTime = new DateTime.now();
  String _entryTitle = 'No Title';
  String _entry = 'No Entry';
  double _emotionRating = 5;
  double _sleepTime = 0;

  final entryController = TextEditingController();
  final entryTitleController = TextEditingController();
  final sleepController = TextEditingController();

  Widget _buildAppBar() {
    return new AppBar(
      title: Text('Add an entry'),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            _entryTitle = entryTitleController.text;
            _entry = entryController.text;
            if (_entryTitle == '') {
              _entryTitle = 'No Title';
            }
            if (_entry == '') {
              _entry = 'No Entry';
            }
            Navigator.of(context).pop(new TimelineEntry(
                _entryTitle, _entry, _dateTime, _emotionRating, _sleepTime));
          },
          child: Text(
            'Save',
            style: Theme.of(context)
                .textTheme
                .subhead
                .copyWith(color: Colors.white),
          ),
        )
      ],
    );
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: _buildAppBar(),
        body: new Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(12.0),
              child: TextField(
                autocorrect: true,
                autofocus: true,
                controller: entryTitleController,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 28,
                ),
                decoration: InputDecoration(
                  hintText: 'Title your entry',
                  hintStyle: TextStyle(
                    fontSize: 28,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 4),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(12.0),
              child: TextField(
                autocorrect: true,
                controller: entryController,
                maxLines: null,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  hintText: 'Type your entry',
                  hintStyle: TextStyle(
                    fontSize: 16,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 4),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
                child: Text(
              'How was your day?',
              style: TextStyle(fontSize: 20),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 8),
                  child: Image.asset('assets/sad-face.png', height: 60),
                ),
                Slider(
                  min: 1,
                  max: 10,
                  divisions: 9,
                  label: '${_emotionRating.toInt()}',
                  value: _emotionRating,
                  onChanged: (value) {
                    setState(() {
                      _emotionRating = value;
                    });
                  },
                ),
                Container(
                  padding: EdgeInsets.only(right: 8),
                  child: Image.asset('assets/happy-face.png', height: 60),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                padding: EdgeInsets.only(left: 12),
                child: Text(
                  'Amount of sleep:',
                  style: TextStyle(fontSize: 20),
                )),
            Slider(
              min: 0,
              max: 12,
              divisions: 12,
              label: '${_sleepTime.toInt()}',
              value: _sleepTime,
              onChanged: (value) {
                setState(() {
                  _sleepTime = value;
                });
              },
            ),
          ],
        ));
  }

  @override
  void dispose() {
    entryController.dispose();
    entryTitleController.dispose();
    super.dispose();
  }
}
