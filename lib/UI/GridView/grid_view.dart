import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yeni_neonapps/UI/GridView/Detail_screen.dart';

class MermaidApp extends StatefulWidget {
  const MermaidApp({super.key});

  @override
  State<MermaidApp> createState() => _MermaidAppState();
}

class _MermaidAppState extends State<MermaidApp> {
  List<Map<String, dynamic>> apps = [
    {
      'appIcon': Icons.ac_unit,
      'appName': 'AC Unit',
      'releaseDate': '2021-10-10',
      'appCategory': 'Utility',
      'storeUrl':
          'https://play.google.com/store/apps/details?id=com.google.android.apps.maps',
    },
  ];

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        apps.add({
          'appIcon': Icons.adb,
          'appName': 'New App',
          'releaseDate': '2023-12-30',
          'appCategory': 'Development',
          'storeUrl':
              'https://play.google.com/store/apps/details?id=com.example.newapp',
        });
      });
      _refreshController.refreshCompleted();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Neon Apps'),
      ),
      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: apps.length,
          itemBuilder: (context, index) {
            final app = apps[index];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(app: app),
                  ),
                );
              },
              child: CupertinoContextMenu(
                actions: [
                  CupertinoContextMenuAction(
                    child: const Text('Share'),
                    onPressed: () {
                      Navigator.pop(context); // Menüden çık
                      // Paylaşım işlevi (örnek)
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Shared: ${app['appName']}'),
                        ),
                      );
                    },
                  ),
                ],
                child: Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        app['appIcon'] ?? Icons.error,
                        size: 50,
                        color: Colors.blue,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        app['appName'] ?? 'Unknown',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        app['releaseDate'] ?? 'Unknown Date',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
