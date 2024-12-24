// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';

const String appName = "Awesome Gallery";

class AwesomeGallery extends StatefulWidget {
  const AwesomeGallery({super.key});

  @override
  State<AwesomeGallery> createState() => _AwesomeGalleryState();
}

final images = [
  {'url': 'assets/sehir.jpg', 'title': 'Sehir'},
  {'url': 'assets/dag.jpg', 'title': 'Dag'},
  {'url': 'assets/okyanus.jpg', 'title': 'Okyanus'},
  {'url': 'assets/doga.jpg', 'title': 'Doga'},
];

class _AwesomeGalleryState extends State<AwesomeGallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appName),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 10,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          final image = images[index];
          return GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${image['title']}seçildi!')));
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3))
                  ]),
              child: Column(
                children: [
                  Expanded(
                      child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      image['url']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  )),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      image['title']!,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
