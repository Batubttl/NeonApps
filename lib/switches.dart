import 'package:flutter/material.dart';

class SwitchesViewApp extends StatefulWidget {
  const SwitchesViewApp({super.key});

  @override
  State<SwitchesViewApp> createState() => _SwitchesViewAppState();
}

bool switchKey = false;

class _SwitchesViewAppState extends State<SwitchesViewApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switches App'),
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          color: switchKey ? Colors.green : Colors.red,
          child: Switch(
            value: switchKey,
            onChanged: (value) {
              setState(() {
                switchKey = !switchKey;
              });
            },
            activeTrackColor: switchKey ? Colors.red : Colors.green,
            inactiveThumbColor: Colors.green,
          ),
        ),
      ),
    );
  }
}
