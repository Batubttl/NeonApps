import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class FourthPage extends StatefulWidget {
  final Function(Color) onColorSelected;

  const FourthPage({super.key, required this.onColorSelected});

  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  Color selectedColor = Colors.white; // Varsayılan renk

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Renk Seçici"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Renk seçici
            ColorPicker(
              pickerColor: selectedColor,
              onColorChanged: (color) {
                setState(() {
                  selectedColor = color; // Seçilen rengi güncelle
                });
              },
            ),
            const SizedBox(height: 20),
            // Rengi kaydet düğmesi
            ElevatedButton(
              onPressed: () {
                widget.onColorSelected(
                    selectedColor); // Seçilen rengi geri döndür
                Navigator.pop(context); // FourthPage'den çık
              },
              child: const Text("Rengi Kaydet"),
            ),
          ],
        ),
      ),
    );
  }
}
