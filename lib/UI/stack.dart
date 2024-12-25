import 'package:flutter/material.dart';

class StackViewApp extends StatelessWidget {
  const StackViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Harry Poters and Voldemorts'),
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/hogwarts.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              top: screenHeight * 0.2,
              right: screenWidth * 0.1,
              child: const Text(
                'Expecto Paranum!',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )),
          Positioned(
              top: screenHeight * 0.4,
              left: screenWidth * 0.2,
              child: const Text(
                'Expelliarmus!',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
