import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'astronout_provider.dart';

class AstronautApp extends StatelessWidget {
  const AstronautApp({super.key});

  @override
  Widget build(BuildContext context) {
    final astronautProvider = Provider.of<AstronautProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Astronaut Mission Control'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Provider'dan alınan mesaj
          Text(
            astronautProvider.message,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              astronautProvider.updateMessage("Keep going, Astronaut!");
            },
            child: const Text('Update Message'),
          ),
        ],
      ),
    );
  }
}
