import 'dart:ui';
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
  double _blurValue = 10.0;

  void _startProcessing() {
    setState(() {
      _isProcessing = true;
    });

    // Simulate the sharpening process
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _progress = 1.0;
        _isProcessing = false;
        _blurValue = 0.0;
      });
    });

    // Simulate progress update
    for (int i = 1; i <= 100; i++) {
      Future.delayed(Duration(milliseconds: 50 * i), () {
        setState(() {
          _progress = i / 100;
          _blurValue = 10.0 * (1 - _progress);
        });
      });
    }
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
              Column(
                children: [
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
                  const SizedBox(height: 20),
                  CircularProgressIndicator(value: _progress),
                ],
              ),
            if (!_isProcessing)
              Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/biho.webp', // Replace with your image asset
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      if (_progress < 1.0)
                        BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: _blurValue,
                            sigmaY: _blurValue,
                          ),
                          child: Container(
                            width: 200,
                            height: 200,
                            color: Colors.transparent,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Progress: ${(_progress * 100).toStringAsFixed(0)}%',
                    style: const TextStyle(fontSize: 24),
                  ),
                ],
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
