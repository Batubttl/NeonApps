import 'package:flutter/material.dart';

class AstronautProvider with ChangeNotifier {
  String _message = "Hello, Astronaut!";
  String get message => _message;

  void updateMessage(String newMessage) {
    _message = newMessage;
    notifyListeners();
  }
}
