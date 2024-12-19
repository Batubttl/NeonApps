import 'package:flutter/material.dart';

class ArticleNews extends StatelessWidget {
  const ArticleNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Articles'),
        ),
        body: ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            final article = articles[index];
            return Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: Image.asset(
                  article.url,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(article.title),
                subtitle: Text(article.description),
              ),
            );
          },
        ));
  }
}

// ignore: empty_constructor_bodies
class Articles {
  final String title;
  final String description;
  final String url;

  Articles({required this.title, required this.description, required this.url});
}

final List<Articles> articles = [
  Articles(
    title: 'Breaking News : Flutter is Amazing',
    description: 'Discover why Flutter is the best framework for building beautiful apps.',
    url: ('assets/ac.jpeg'),
  ),
  Articles(
    title: 'Breaking News : Flutter is upgrading',
    description: 'Discover everything about flutter on our page',
    url: ('assets/comedyclub.jpeg')),
  Articles(
    title: 'Breaking News : Flutter is Amazing',
    description: 'Discover why Flutter is the best framework for building beautiful apps.',
    url: ('assets/okyanus.jpg'),
  ),
  Articles(
    title: 'Breaking News : Flutter is Amazing',
    description: 'Discover why Flutter is the best framework for building beautiful apps.',
    url: ('assets/sehir.jpg'),
  ),
  Articles(
    title: 'Breaking News : Flutter is Amazing',
    description: 'Discover why Flutter is the best framework for building beautiful apps.',
    url: ('assets/ricky.jpeg'),
  ),
  Articles(
    title: 'Breaking News : Flutter is Amazing',
    description: 'Discover why Flutter is the best framework for building beautiful apps.',
    url: ('assets/ac.jpeg')),
];
