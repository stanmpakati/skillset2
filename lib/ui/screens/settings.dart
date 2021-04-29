import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newserverdemo/ui/shared/utils/dark_theme.dart';
import 'package:newserverdemo/ui/shared/utils/light_theme.dart';
import 'package:newserverdemo/ui/shared/utils/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationIsSwitched = true;
  bool autoDownloadIsSwitched = true;
  bool darkModeIsSwitched = true;
  bool downloadOverCellularIsSwitched = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  // @override
  // void initState() async {
  //   super.initState();
  // }

  void switchToggle(bool value) {
    setState(() {
      value = !value;
    });
  }

  void saveSettings() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setBool('notifications', notificationIsSwitched);
    sharedPrefs.setBool('autoDownload', autoDownloadIsSwitched);
    sharedPrefs.setBool('downloadOverCellular', downloadOverCellularIsSwitched);
    sharedPrefs.setBool('darkMode', darkModeIsSwitched);
  }

  void onNotificationChanged(bool value) {}

  void onAutoDownloadChanged(bool value) {}

  void onCellularChanged(bool value) {}

  //this procedure
  void onThemeChanged(bool value, ThemeNotifier themeNotifier) async {
    (value)
        ? themeNotifier.setTheme(darkTheme)
        : themeNotifier.setTheme(lightTheme);
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', value);
  }

  void onToggle(String settingChanged, bool value) {
    print('Changed');
    String onOff() => value ? 'on' : 'off';
    SnackBar snackBar = new SnackBar(
      content: Text('$settingChanged ${onOff()}'),
      duration: Duration(seconds: 2),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    darkModeIsSwitched = (themeNotifier.getTheme() == darkTheme);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 14.0),
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Icon(Icons.notifications),
              ),
              Expanded(
                child: Text(
                  'Notifations',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Switch(
                value: notificationIsSwitched,
                activeTrackColor: Theme.of(context).accentColor,
                activeColor: Colors.black,
                onChanged: (bool newValue) async {
                  setState(() {
                    notificationIsSwitched = newValue;
                  });
                  onNotificationChanged(newValue);
                  onToggle('Notifications', newValue);
                },
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Icon(Icons.file_download),
              ),
              Expanded(
                child: Text(
                  'Auto Download',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Switch(
                value: autoDownloadIsSwitched,
                // onChanged: switchToggle(autoDownloadIsSwitched),
                activeTrackColor: Theme.of(context).accentColor,
                activeColor: Colors.black,
                onChanged: (bool newValue) async {
                  setState(() {
                    autoDownloadIsSwitched = newValue;
                  });
                  onAutoDownloadChanged(newValue);
                  onToggle('Auto Download', newValue);
                },
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Icon(Icons.wifi),
              ),
              Expanded(
                child: Text(
                  'Download Over Cellular',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Switch(
                value: downloadOverCellularIsSwitched,
                activeTrackColor: Theme.of(context).accentColor,
                activeColor: Colors.black,
                onChanged: (bool newValue) async {
                  setState(() {
                    downloadOverCellularIsSwitched = newValue;
                  });
                  onCellularChanged(newValue);
                  onToggle('Download Over Cellular', newValue);
                },
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Icon(Icons.wb_sunny),
              ),
              Expanded(
                child: Text(
                  'Night Mode',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Switch(
                value: darkModeIsSwitched,
                activeTrackColor: Theme.of(context).accentColor,
                activeColor: Colors.black,
                onChanged: (bool newValue) async {
                  setState(() {
                    darkModeIsSwitched = newValue;
                  });
                  onThemeChanged(newValue, themeNotifier);
                  onToggle('Night mode', newValue);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
