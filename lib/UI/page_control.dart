import 'package:flutter/material.dart';

class PageControlViewApp extends StatefulWidget {
  const PageControlViewApp({super.key});

  @override
  State<PageControlViewApp> createState() => _PageControlViewAppState();
}

class _PageControlViewAppState extends State<PageControlViewApp> {
  final PageController _controller = PageController();
  int _currentpage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Princes View App'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
              child: PageView(
            controller: _controller,
            onPageChanged: (page) {
              setState(() {
                _currentpage = page;
              });
            },
            children: [
              _buildPage('Page1', 'page 1 descriptions', 'assets/Atina.jpeg'),
              _buildPage('Page2', 'page 2 descriptions', 'assets/dag.jpg'),
              _buildPage('Page3', 'page 3 descriptions', 'assets/doga.jpg'),
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
