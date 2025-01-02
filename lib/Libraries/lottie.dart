import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieExample extends StatefulWidget {
  const LottieExample({super.key});

  @override
  _LottieExampleState createState() => _LottieExampleState();
}

class _LottieExampleState extends State<LottieExample> {
  double _progress = 0.0;
  bool _isProcessing = false;

  void _startProcessing() {
    setState(() {
      _isProcessing = true;
    });

    // Simulate the sharpening process
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _progress = 1.0;
        _isProcessing = false;
      });
    });
  }

  void _stopProcessing() {
    setState(() {
      _isProcessing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Lottie Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isProcessing)
              Lottie.asset(
                'assets/Loading.json',
                width: 200,
                height: 200,
                animate: true,
                fit: BoxFit.cover,
                onLoaded: (composition) {
                  // Start the animation
                },
              ),
            if (!_isProcessing)
              Text(
                'Progress: ${(_progress * 100).toStringAsFixed(0)}%',
                style: const TextStyle(fontSize: 24),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isProcessing ? _stopProcessing : _startProcessing,
              child: Text(_isProcessing ? 'Stop' : 'Start'),
            ),
          ],
        ),
      ),
    );
  }
}
