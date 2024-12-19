import 'package:flutter/material.dart';

const String welcomeMessage = "WELCOME TO COMEDY CLUB";

class ComedyClubScreen extends StatefulWidget {
  const ComedyClubScreen({super.key});

  @override
  State<ComedyClubScreen> createState() => _ComedyClubScreenState();
}

class _ComedyClubScreenState extends State<ComedyClubScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comedy Club"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/comedyclub.jpeg',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            // Kulüp Adı
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Comedy Club'a Hoşgeldiniz!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const Divider(color: Colors.grey),
            // Yaklaşan Gösteriler ve Bilet Bilgileri
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Yaklaşan Gösteriler",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  _showCard(
                    date: "15 Aralık 2024",
                    image: 'assets/cmylmz.jpeg',
                  ),
                  _showCard(
                    date: "20 Aralık 2024",
                    image: 'assets/ricky.jpeg',
                  ),
                  _showCard(
                    date: "25 Aralık 2024",
                    image: 'assets/adamsandler.jpeg',
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey.shade400,
            ),
            // Bilet Bilgisi
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Biletlerinizi alın ve eğlenceye dahil olun!",
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Eski Etkinlikler (Galeri)
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Galeri : Güldüren Anlar",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _galleryImage('assets/kevinhart.jpeg'),
                  _galleryImage('assets/Seul.jpg'),
                  _galleryImage('assets/İstanbul.jpeg'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _showCard({
    required String date,
    required String image,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.asset(
              image,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              date,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _galleryImage(String imagePath) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: 120,
      child: ClipRRect(
        borderRadius: BorderRadiusDirectional.circular(10),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
