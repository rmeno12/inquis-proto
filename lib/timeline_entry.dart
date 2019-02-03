import 'package:flutter/material.dart';

class TimelineEntry extends StatelessWidget {
  TimelineEntry(this.entryTitle, this.entry, this.dateTime, this.emotionRating,
      this.sleepTime);
  final String entryTitle;
  final String entry;
  final DateTime dateTime;
  final double emotionRating;
  final double sleepTime;
  final List<String> _months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  Widget build(BuildContext context) {
    return new Card(
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    entryTitle,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  this.emotionRating > 5 ? Icons.thumb_up : Icons.thumb_down,
                  color: this.emotionRating > 5
                      ? Colors.green[700]
                      : Colors.red[700],
                  size: 32,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 9),
            child: Text(
              '${_months[dateTime.month - 1]} ${dateTime.day}, ${dateTime.year} at '
                  '${dateTime.hour}:${dateTime.minute}',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 9),
            child: Text(
              '${sleepTime.toInt()} hours of sleep',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(12.0),
            child: Text(entry),
          )
        ],
      ),
    );
  }
}
