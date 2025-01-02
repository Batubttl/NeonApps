import 'package:flutter/material.dart';

class MazeScreen extends StatefulWidget {
  const MazeScreen({super.key});

  @override
  State<MazeScreen> createState() => _MazeScreenState();
}

class _MazeScreenState extends State<MazeScreen> {
  final List<String> _path = [
    'UP',
    'RIGHT',
    'RIGHT',
    'DOWN',
    'LEFT',
    'UP',
    'LEFT'
  ];
  int _currentStep = 0;
  String _message = 'Navigate the maze to reach the end!';

  // Image position variables
  double _imageX = 0.0; // Horizontal position
  double _imageY = 0.0; // Vertical position

  void _move(String direction) {
    if (direction == _path[_currentStep]) {
      setState(() {
        _currentStep++;

        // Update the image position based on direction
        switch (direction) {
          case 'UP':
            _imageY -= 50;
            break;
          case 'DOWN':
            _imageY += 50;
            break;
          case 'LEFT':
            _imageX -= 50;
            break;
          case 'RIGHT':
            _imageX += 50;
            break;
        }

        if (_currentStep == _path.length) {
          _message = 'Congratulations! You did it!';
        } else {
          _message = 'Keep going!';
        }
      });
    } else {
      setState(() {
        _message = 'You are trapped! Try again!';
        _currentStep = 0; // Reset the maze if trapped
        _imageX = 0.0; // Reset image position
        _imageY = 0.0;
      });
    }
    if (_message == 'Congratulations! You did it!') {}
  }

  Widget _buildArrow(String direction, IconData icon, String tag) {
    return Hero(
      tag: tag,
      child: ElevatedButton(
        onPressed: () => _move(direction),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(20),
          shape: const CircleBorder(),
        ),
        child: Icon(
          icon,
          size: 50,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maze App'),
      ),
      body: Stack(
        children: [
          // Image to move
          Positioned(
            left: MediaQuery.of(context).size.width / 4 + _imageX,
            top: MediaQuery.of(context).size.height / 4 + _imageY,
            child: Hero(
              tag: 'character',
              child: Image.asset(
                'assets/bihter.jpeg', // Replace with your image path
                width: 200,
                height: 200,
              ),
            ),
          ),
          // Controls and message
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _message,
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 400),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildArrow('UP', Icons.arrow_upward, 'UP'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildArrow('LEFT', Icons.arrow_back, 'LEFT'),
                        const SizedBox(width: 20),
                        _buildArrow('RIGHT', Icons.arrow_forward, 'RIGHT'),
                      ],
                    ),
                    _buildArrow('DOWN', Icons.arrow_downward, 'DOWN'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
