import 'package:flutter/material.dart';

class SlidersViewApp extends StatefulWidget {
  const SlidersViewApp({super.key});

  @override
  State<SlidersViewApp> createState() => _SlidersViewAppState();
}

double slidersvalue = 0.0;

class _SlidersViewAppState extends State<SlidersViewApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliders App'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Sliders App'),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                thumbShape:
                    const RoundSliderThumbShape(enabledThumbRadius: 12.0),
                overlayShape:
                    const RoundSliderOverlayShape(overlayRadius: 24.0),
              ),
              child: Slider(
                value: slidersvalue,
                onChanged: (value) {
                  setState(() {
                    slidersvalue = value;
                  });
                },
                min: 0,
                max: 100,
                divisions: 100,
                label: slidersvalue.round().toString(),
                thumbColor: Colors.blue,
                activeColor: Colors.red,
                inactiveColor: Colors.green,
              ),
            ),
            const SizedBox(height: 20),
            Text('Aşama : $slidersvalue'),
            if (slidersvalue >= 50) Image.asset('assets/reddragon.jpg'),
            if (slidersvalue < 50) Image.asset('assets/greendragon.jpg')
          ],
        ),
      ),
    );
  }
}
