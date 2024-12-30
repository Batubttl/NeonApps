import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:yeni_neonapps/UI/Pickers/second_page.dart';
import 'package:yeni_neonapps/UI/Pickers/third_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  File? profilImage;
  String userName = "Kullanıcı Adı";
  String userAge = "Kullanıcı Yaşı";
  String selectedFont = "Roboto";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: const Text("Kullanıcı bilgileri"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: profilImage != null
                ? FileImage(profilImage!)
                : const AssetImage("assets/vesikalık.jpeg") as ImageProvider,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            userName,
            style: GoogleFonts.getFont(selectedFont,
                fontSize: 20, color: Colors.black),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            userAge,
            style: GoogleFonts.getFont(selectedFont,
                fontSize: 20, color: Colors.black),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SecondPage(
                              onImageSelected: (image) {
                                setState(() {
                                  profilImage = image;
                                });
                              },
                            ),
                          ));
                    },
                    child: const Text("Fotoğraf seç !")),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ThirdPage(
                      onFontSelected: (font) {
                        setState(() {
                          selectedFont = font;
                        });
                      },
                    ),
                  ),
                );
              },
              child: const Text("Yazı Tipi Değiştir")),
        ],
      ),
    );
  }
}
