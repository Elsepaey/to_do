import 'package:flutter/material.dart';
import 'package:to_do/pages/setting/setting_section.dart';
import 'package:to_do/pages/setting/toggle_setting.dart';
import 'package:to_do/themes.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Initial Selected Value
  String languagevalue = "Arabic";
  String themevalue = "Light";

  // List of items in our dropdown menu
  var languagesitems = ["Arabic", "English"];
  var themesitems = ["Light", "Dark"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 12,
          ),
          SettingSection(
            title: 'Notifications',
            children: [
              ToggleSetting(
                title: 'Allow notifications',
                value: false,
                onChanged: () {},
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 100,
          ),
          SettingSection(
            title: 'theme',
            children: [
              ListTile(
                title: Text("Themes"),
                trailing: DropdownButton(

                  // Initial Value
                  value: themevalue,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: themesitems.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(
                        items,
                        style: TextStyle(
                            color: items == themevalue
                                ? MyThemeData.primaryBlue
                                : Colors.black),
                      ),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      themevalue = newValue!;
                    });
                  },
                ),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 100,
          ),
          SettingSection(
            title: 'language',
            children: [
              ListTile(
                title: Text("Languages"),
                trailing: DropdownButton(
                  // Initial Value
                  value: languagevalue,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: languagesitems.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(
                        items,
                        style: TextStyle(
                            color: items == languagevalue
                                ? MyThemeData.primaryBlue
                                : Colors.black),
                      ),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      languagevalue = newValue!;
                    });
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
