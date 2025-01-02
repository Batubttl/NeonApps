import 'package:flutter/material.dart';
import 'package:yeni_neonapps/Libraries/Screen2.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maze App'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Welcome to the Maze App!',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Welcome to the maze. If you succeed, you are ready for the real world",
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MazeScreen(),
                    ));
              },
              child: const Text('Continue'))
        ],
      )),
    );
  }
}
