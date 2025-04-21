import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _isDarkMode = false;//contrls themes

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = _isDarkMode ? ThemeData.dark() : ThemeData.light();//its like an if statement
    return Theme(
      data: theme,
      child: Scaffold(
        appBar: AppBar(title: Text("Setting")),
        body: ListView(
          children: [
            ListTile(
              title: Text("Change Mode"),
              trailing: Switch(
                value: _isDarkMode,
                onChanged: (value) {
                  setState(() {
                    _isDarkMode = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
