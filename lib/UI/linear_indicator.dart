import 'package:flutter/material.dart';

class LinearProgressView extends StatefulWidget {
  const LinearProgressView({super.key});

  @override
  State<LinearProgressView> createState() => _LinearProgressViewState();
}

class _LinearProgressViewState extends State<LinearProgressView> {
  double _progressValue = 0.0;

  void _incrementProgress() {
    setState(() {
      if (_progressValue < 10) {
        _progressValue++;
      } else {
        _progressValue = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Alaaddins Flutter Adventures'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LinearProgressIndicator(
                value: _progressValue / 10,
                color: _progressValue == 10 ? Colors.black : Colors.blue),
            const SizedBox(
              height: 20,
            ),
            Text(
              'İlerleme: ${_progressValue.toStringAsFixed(0)}', // İlerlemeyi yazdırıyoruz
              style: const TextStyle(fontSize: 24),
            ),
            ElevatedButton(
                onPressed: () {
                  _incrementProgress();
                },
                child: const Text('Continue'))
          ],
        ),
      ),
    );
  }
}
