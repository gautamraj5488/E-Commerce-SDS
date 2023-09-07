import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'homepage.dart';


void main() {
  runApp(SettingsApp());
}

class SettingsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Settings Page',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationsEnabled = true;
  bool darkModeEnabled = false;
  bool receivePromotions = true;
  int notificationFrequency = 1;
  String selectedLanguage = 'English'; // Default language is English

  // Define localized strings
  late String settingsLabel;
  late String enableNotificationsLabel;
  late String darkModeLabel;
  late String receivePromotionsLabel;
  late String notificationFrequencyLabel;
  late List<String> languageOptions;

  @override
  void initState() {
    super.initState();

    // Initialize localized strings
    settingsLabel = Intl.message('Settings');
    enableNotificationsLabel = Intl.message('Enable Notifications');
    darkModeLabel = Intl.message('Dark Mode');
    receivePromotionsLabel = Intl.message('Receive Promotions');
    notificationFrequencyLabel = Intl.message('Notification Frequency');
    languageOptions = ['English', 'Hindi'];
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        brightness: darkModeEnabled ? Brightness.dark : Brightness.light,
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  homepage()),
              );

            },

          ),
          title: Text(settingsLabel),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildSectionTitle(settingsLabel),
                SwitchListTile(
                  title: Text(enableNotificationsLabel),
                  value: notificationsEnabled,
                  onChanged: (value) {
                    setState(() {
                      notificationsEnabled = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text(darkModeLabel),
                  value: darkModeEnabled,
                  onChanged: (value) {
                    setState(() {
                      darkModeEnabled = value;
                    });
                  },
                ),
                _buildDropdown(
                  'Language',
                  selectedLanguage,
                      (value) {
                    setState(() {
                      selectedLanguage = value!;
                    });
                  },
                  languageOptions,
                ),
                SizedBox(height: 20.0),
                _buildSectionTitle('Email Notifications'),
                SwitchListTile(
                  title: Text(receivePromotionsLabel),
                  value: receivePromotions,
                  onChanged: (value) {
                    setState(() {
                      receivePromotions = value;
                    });
                  },
                ),
                ListTile(
                  title: Text(notificationFrequencyLabel),
                  trailing: DropdownButton<int>(
                    value: notificationFrequency,
                    items: [
                      DropdownMenuItem<int>(
                        value: 1,
                        child: Text('Every hour', style: TextStyle(fontSize: 16)),
                      ),
                      DropdownMenuItem<int>(
                        value: 2,
                        child: Text('Every 2 hours', style: TextStyle(fontSize: 16)),
                      ),
                      DropdownMenuItem<int>(
                        value: 3,
                        child: Text('Every 3 hours', style: TextStyle(fontSize: 16)),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        notificationFrequency = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildDropdown(
      String title, String? value, ValueChanged<String?> onChanged, List<String> options) {
    return ListTile(
      title: Text(title, style: TextStyle(fontSize: 18)),
      trailing: DropdownButton<String>(
        value: value,
        items: options.map((option) {
          return DropdownMenuItem<String>(
            value: option,
            child: Text(option, style: TextStyle(fontSize: 16)),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
