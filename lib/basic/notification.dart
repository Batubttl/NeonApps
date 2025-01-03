import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class DecryptScreen extends StatefulWidget {
  const DecryptScreen({super.key});

  @override
  State<DecryptScreen> createState() => _DecryptScreenState();
}

class _DecryptScreenState extends State<DecryptScreen> {
  final TextEditingController _codeController = TextEditingController();
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  bool _isDecrypting = false;
  bool _isCodeEntered = false;
  final String _correctCode = "1234"; // Doğru şifre

  @override
  void initState() {
    super.initState();
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettings = InitializationSettings(android: android);

    flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        debugPrint('Notification clicked: ${response.payload}');
      },
    );
  }

  void _startDecryption() {
    setState(() {
      _isDecrypting = true;
      _isCodeEntered = false;
    });

    Future.delayed(const Duration(seconds: 10), () {
      setState(() {
        _isDecrypting = false;
        _isCodeEntered = true;
      });

      if (_codeController.text == _correctCode) {
        // Şifre doğruysa bildirim gönder
        _sendNotification('Decrypted Message: Şifre Çözüldü!');
      } else {
        // Şifre yanlışsa hata mesajı göster
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Yanlış şifre, lütfen tekrar deneyin.')),
        );
      }
    });
  }

  void _sendNotification(String message) {
    const androidDetails = AndroidNotificationDetails(
      'channelId',
      'channelName',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );
    const notificationDetails = NotificationDetails(android: androidDetails);

    flutterLocalNotificationsPlugin.show(
      0,
      'Decryption Complete',
      message,
      notificationDetails,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Decrypt Message'),
          leading: _isDecrypting || _isCodeEntered
              ? IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    setState(() {
                      // "Decrypt" ekranına geri dön
                      _isDecrypting = false;
                      _isCodeEntered = false;
                      _codeController.clear();
                    });
                  },
                )
              : null),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!_isDecrypting && !_isCodeEntered)
              ElevatedButton(
                onPressed: _startDecryption,
                child: const Text('Decrypt'),
              ),
            if (_isDecrypting)
              Column(
                children: [
                  TextField(
                    controller: _codeController,
                    decoration: const InputDecoration(
                      labelText: 'Enter code',
                    ),
                  ),
                  const SizedBox(height: 20),
                  const CircularProgressIndicator(),
                  const SizedBox(height: 20),
                  const Text('You have 10 seconds to enter the code.'),
                ],
              ),
            if (!_isDecrypting && _isCodeEntered)
              const Text('Decryption process completed.'),
          ],
        ),
      ),
    );
  }
}
