import 'package:flutter/material.dart';

class PageControlViewApp extends StatefulWidget {
  const PageControlViewApp({super.key});

  @override
  State<PageControlViewApp> createState() => _PageControlViewAppState();
}

class _PageControlViewAppState extends State<PageControlViewApp> {
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Princes View App'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
              child: PageView(
            controller: _controller,
            onPageChanged: (page) {
              setState(() {});
            },
            children: [
              _buildPage(
                  'Batu Yaren', 'Bir aşkın Başlangıcı!', 'assets/by.jpeg'),
              _buildPage('Sadece Yaren', 'Benim Birtanecik SEVGİLİM!',
                  'assets/yrn.jpg'),
              _buildPage(
                  'Bihterim!', 'Aşkımızın Meyvesi :)', 'assets/biho.webp'),
            ],
          ))
        ],
      ),
    );
  }
}

Widget _buildPage(String title, String subtitle, String imagePath) {
  return Container(
    color: Colors.grey,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
        ),
        Text(subtitle),
        Image.asset(imagePath)
      ],
    ),
  );
}
