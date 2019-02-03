import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  final String settingName;
  final String settingDescription;
  final bool _thing = false;
  SettingsItem(this.settingName, this.settingDescription);

  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  settingName,
                  style: TextStyle(
                    fontSize: 20,
                  ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                settingDescription,
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic
                ),
              ),
            ),
          ],
        ),
        Switch(
          onChanged: (_thing) => {},
          value: false,
        )
      ],
    );
  }
}