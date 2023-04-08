import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListWheelScrollView(
        itemExtent: 100,
        children: [
          for (var x in [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
            FractionallySizedBox(
              widthFactor: 1,
              child: Container(
                child: const Text(
                  "pick me",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 39,
                  ),
                ),
                color: Colors.teal,
                alignment: Alignment.center,
              ),
            ),
        ],
      ),
    );
  }
}
