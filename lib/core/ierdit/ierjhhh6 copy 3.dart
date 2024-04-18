import 'package:flutter/material.dart';

class SettingsScreenMgyehjsdsd extends StatefulWidget {
  @override
  _SettingsScreenMgyehjsdsdState createState() => _SettingsScreenMgyehjsdsdState();
}

class _SettingsScreenMgyehjsdsdState extends State<SettingsScreenMgyehjsdsd> {
  bool notificationsEnabled = true;

  void changeSettings(bool newValue) {
    setState(() {
      notificationsEnabled = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SwitchListTile(
          title: Text('Enable Notifications'),
          value: notificationsEnabled,
          onChanged: changeSettings,
        ),
      ),
    );
  }
}
