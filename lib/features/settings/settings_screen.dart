import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = false;

  void _onNotificationsChanged(bool? newValue) {
    if (newValue == null) {
      return;
    }
    setState(() {
      _notifications = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          Switch.adaptive(
            value: _notifications,
            onChanged: _onNotificationsChanged,
          ),
          CupertinoSwitch(
            value: _notifications,
            onChanged: _onNotificationsChanged,
          ),
          SwitchListTile(
            title: const Text(
              "Enable notifications",
            ),
            value: _notifications,
            onChanged: _onNotificationsChanged,
          ),
          CheckboxListTile(
            activeColor: Colors.black,
            value: _notifications,
            onChanged: _onNotificationsChanged,
            title: const Text(
              "Enable notifications",
            ),
          ),
          ListTile(
            title: const Text('What is your birthday?'),
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2030),
              );
              print(date);
              // ignore: use_build_context_synchronously
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              print(time);
              // ignore: use_build_context_synchronously
              final booking = await showDateRangePicker(
                context: context,
                firstDate: DateTime(1900),
                lastDate: DateTime(2030),
                builder: (context, child) {
                  return Theme(
                    data: ThemeData(
                      appBarTheme: const AppBarTheme(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                    ),
                    child: child!,
                  );
                },
              );

              print(booking);
            },
          ),
          const AboutListTile(),
        ],
      ),
    );
  }
}
