import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SegmententedDinaView extends StatefulWidget {
  const SegmententedDinaView({super.key});

  @override
  State<SegmententedDinaView> createState() => _SegmententedDinaViewState();
}

final Map<int, Widget> _segments = const {
  0: Text('Neon Academy Members 1 '),
  1: Text('Neon Academies 2'),
  2: Text('Neon Aacademy Rising Stars 3')
};

double _controllerHeight = 50;

class _SegmententedDinaViewState extends State<SegmententedDinaView> {
  void _onSegmentChanged(int value) {
    setState(() {
      _selectedSegment = value;
    });
    if (value == 0) {
      _controllerHeight = 70;
    } else if (value == 1) {
      _controllerHeight = 60;
    } else {
      _controllerHeight = 50;
    }
  }

  int _selectedSegment = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segmented Control View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoSegmentedControl<int>(
              children: _segments,
              onValueChanged: _onSegmentChanged,
              groupValue: _selectedSegment,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: _controllerHeight,
              color: Colors.blue,
              child: Center(
                child: Text(_segments[_selectedSegment].toString()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
