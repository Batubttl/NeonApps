import 'package:flutter/material.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  final List<Map<String, String>> _pages = [
    {
      "title": "Welcome the new Page",
      "subtitle": "This page gonna be fun",
      "image": "assets/adamsandler.jpeg"
    },
    {
      "title": "Welcome the second Page",
      "subtitle": "This page gonna be sad",
      "image": "assets/İbiza.jpg"
    },
    {
      "title": "Welcome the third Page",
      "subtitle": "This page gonna be amazing",
      "image": "assets/doga.jpg"
    },
    {
      "title": "Welcome the third Page",
      "subtitle": "This page gonna be dissapointed",
      "image": "assets/FCork.jpeg"
    },
  ];

  final PageController _pageController = PageController();
  // ignore: unused_field
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page View Example"),
      ),
      body: Column(
        children: [
          Expanded(
              child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              final page = _pages[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    page["image"]!,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    page["title"]!,
                    style: const TextStyle(
                        fontStyle: FontStyle.normal, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    page["subtitle"]!,
                    style: const TextStyle(
                        fontStyle: FontStyle.italic, fontSize: 15),
                  )
                ],
              );
            },
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                color: Colors.red,
              )
            ],
          )
        ],
      ),
    );
  }
}
