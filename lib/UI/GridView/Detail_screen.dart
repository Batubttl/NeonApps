import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> app;

  const DetailScreen({super.key, required this.app});

  // URL'yi açma işlevi
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(app['appName'])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(
                app['appIcon'],
                size: 100,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Name: ${app['appName']}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Release Date: ${app['releaseDate']}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Category: ${app['appCategory']}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  _launchURL(app['storeUrl']); // URL'yi açar
                },
                icon: const Icon(Icons.open_in_browser),
                label: const Text('Open in Store'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
