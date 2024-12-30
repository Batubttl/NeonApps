import 'dart:io';

import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final Function(File) onImageSelected;
  const SecondPage({super.key, required this.onImageSelected});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Fotoğraf Seçimi'),
      ),
    );
  }
}
