import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThirdPage extends StatefulWidget {
  final Function(String) onFontSelected;
  const ThirdPage({super.key, required this.onFontSelected});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yazı Tipini Seç!'),
      ),
      body: ListView(
        children: GoogleFonts.asMap().entries.map((entry) {
          final fontName = entry.key; // Font ismini alıyoruz
          final fontStyle = entry.value; // Font stilini alıyoruz
          return ListTile(
            title: Text(
              fontName,
              style: fontStyle(),
            ),
            onTap: () {
              // Font seçildiğinde çağırılacak
              widget.onFontSelected(fontName);
              Navigator.pop(context); // Geri dön
            },
          );
        }).toList(), // `map` sonucu bir listeye dönüştürülür.
      ),
    );
  }
}
