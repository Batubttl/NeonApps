import 'package:flutter/material.dart';

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> cities = [
      {'image': 'assets/Berlin.jpeg', 'title': 'Berlin'},
      {'image': 'assets/FCork.jpeg', 'title': 'Cork'},
      {'image': 'assets/İbiza.jpg', 'title': 'Ibiza'},
      {'image': 'assets/İstanbul.jpeg', 'title': 'İstanbul'},
      {'image': 'assets/Seul.jpg', 'title': 'Seul'},
      {'image': 'assets/Atina.jpeg', 'title': 'Atina'},
      {'image': 'assets/İbiza.jpg', 'title': 'Ibiza'},
      {'image': 'assets/İstanbul.jpeg', 'title': 'İstanbul'},
      {'image': 'assets/Seul.jpg', 'title': 'Seul'},
      {'image': 'assets/Atina.jpeg', 'title': 'Atina'},
      {'image': 'assets/Berlin.jpeg', 'title': 'Berlin'},
      {'image': 'assets/FCork.jpeg', 'title': 'Cork'},
      {'image': 'assets/İbiza.jpg', 'title': 'Ibiza'},
      {'image': 'assets/İstanbul.jpeg', 'title': 'İstanbul'},
      {'image': 'assets/Seul.jpg', 'title': 'Seul'},
      {'image': 'assets/Atina.jpeg', 'title': 'Atina'},
      {'image': 'assets/İbiza.jpg', 'title': 'Ibiza'},
      {'image': 'assets/İstanbul.jpeg', 'title': 'İstanbul'},
      {'image': 'assets/Seul.jpg', 'title': 'Seul'},
      {'image': 'assets/Atina.jpeg', 'title': 'Atina'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("TravelEase"),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: cities.length,
        itemBuilder: (context, index) {
          final city = cities[index];
          return Column(
            children: [
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(city['image']!, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 5),
              Expanded(
                flex: 1,
                child: Text(
                  city['title']!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
