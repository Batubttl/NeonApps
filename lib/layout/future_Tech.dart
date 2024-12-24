// ignore: file_names
import 'package:flutter/material.dart';

class TechApp extends StatefulWidget {
  const TechApp({super.key});

  @override
  _FutureTechAppState createState() => _FutureTechAppState();
}

class _FutureTechAppState extends State<TechApp> {
  // Dinamik cihaz listesi
  final List<Map<String, dynamic>> devices = [
    {'name': 'Akıllı Lamba', 'status': true, 'image': 'assets/lamba.jpeg'},
    {'name': 'Klima', 'status': false, 'image': 'assets/ac.jpeg'},
    {'name': 'TV', 'status': false, 'image': 'assets/tv.jpg'},
    {'name': 'Akıllı Süpürge', 'status': true, 'image': 'assets/sup.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('FutureTech'),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Sütun sayısı
              crossAxisSpacing: 20,
              mainAxisSpacing: 50,
            ),
            itemCount: devices.length, // Eleman sayısı dinamik
            itemBuilder: (context, index) {
              final device = devices[index];
              return _deviceCard(
                device: device,
                onSwitchChanged: (bool value) {
                  setState(() {
                    devices[index]['status'] = value;
                  });
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _deviceCard({
    required Map<String, dynamic> device,
    required ValueChanged<bool> onSwitchChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              device['image'],
              height: 50,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            Text(
              device['name'],
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Switch(
              value: device['status'], // Cihazın durumu
              onChanged: onSwitchChanged, // Durum değişikliği
              activeColor: Colors.green,
              inactiveThumbColor: Colors.red,
            ),
            const SizedBox(height: 8),
            Text(
              device['status'] ? "Durum: Açık" : "Durum: Kapalı",
              style: TextStyle(
                fontSize: 14,
                color: device['status'] ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
