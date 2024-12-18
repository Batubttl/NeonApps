import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WickedQueensView extends StatefulWidget {
  WickedQueensView({super.key});

  @override
  State<WickedQueensView> createState() => _WickedQueensViewState();
}

class _WickedQueensViewState extends State<WickedQueensView> {
  final RegExp emailRegx = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
  String errorMessage = " ";

  void validateEmail(String value) {
    setState(() {
      if (emailRegx.hasMatch(value)) {
        errorMessage = '';
      } else {
        errorMessage = "Geçersiz e-posta adresi";
      }
    });
    if (errorMessage.isNotEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(errorMessage)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quenss View'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Center(
            child: (TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  hintText: 'Enter name and Surname'),
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              textInputAction: TextInputAction.done,
              onSubmitted: (_) {
                FocusScope.of(context).unfocus();
              },
            )),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email",
                hintText: "Enter Email",
                errorText: errorMessage.isNotEmpty ? errorMessage : null),
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              validateEmail(value);
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Phone Number',
                hintText: 'Enter phone number'),
            maxLength: 11,
            keyboardType: TextInputType.number,
            style: TextStyle(
                color: Colors.green, decoration: TextDecoration.underline),
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
              child: Text("Kayıt ol"))
        ],
      ),
    );
  }
}
