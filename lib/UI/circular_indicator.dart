import 'package:flutter/material.dart';

class CircularViewApp extends StatefulWidget {
  const CircularViewApp({super.key});

  @override
  State<CircularViewApp> createState() => _CircularViewAppState();
}

class _CircularViewAppState extends State<CircularViewApp> {
  bool _isLoading = false;
  int _currenNumber = 0;
  Color _indicatorColor = Colors.blue;

  void _startCounting() async {
    setState(() {
      _isLoading = true;
      _currenNumber = 0;
    });

    // Sayma işlemi
    for (var i = 0; i <= 100; i++) {
      // Her 10'un katında renk değişimi
      if (i % 10 == 0) {
        setState(() {
          // Rastgele renk değişimi
          _indicatorColor = Color((i * 100000) % 0xFFFFFF);
        });
      }

      // 100ms bekleme süresi
      await Future.delayed(const Duration(milliseconds: 100));

      // Sayı güncelleniyor
      setState(() {
        _currenNumber = i;
      });

      // Debugging için
      debugPrint('Current Number: $_currenNumber');
    }

    // Yükleme işlemi bittiğinde, göstergeleri kapatma
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Busy Bees Challenge'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Eğer yükleme devam ediyorsa, göstergede göster
            if (_isLoading)
              const CircularProgressIndicator(
                color: Colors.red,
                strokeWidth: 6, // Göstergenin kalınlığını ayarla
              ),
            const SizedBox(height: 20),
            Text(
              'Current Number: $_currenNumber',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    _indicatorColor, // Buton rengini indicator rengi ile ayarla
              ),
              onPressed: () {
                _startCounting(); // Sayma işlemini başlat
              },
              child: const Text('Start Counting'),
            ),
          ],
        ),
      ),
    );
  }
}
