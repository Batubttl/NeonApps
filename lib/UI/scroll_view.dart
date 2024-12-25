import 'package:flutter/material.dart';

class ScrollViewApp extends StatefulWidget {
  const ScrollViewApp({super.key});

  @override
  State<ScrollViewApp> createState() => _ScrollViewAppState();
}

class _ScrollViewAppState extends State<ScrollViewApp> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(
      () {
        if (_scrollController.position.atEdge) {
          if (_scrollController.position.pixels != 0) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('You have reached end of the scrool view '),
                duration: Duration(seconds: 2)));
          }
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iron Man Scroll Adventure'),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            ...List.generate(10, (index) {
              return Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: index % 2 == 0 ? Colors.red : Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  'Spell : ${index + 1}',
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
