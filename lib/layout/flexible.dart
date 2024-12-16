import 'package:flutter/material.dart';

void main() {
  runApp(FinSmartApp());
}

class FinSmartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FinnSmart'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            width: 300,
            child: Image.asset('assets/indrmsesdes.png'),
          ),
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hoş Geldiniz, Sarah!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Finansal durumunuzu kolayca yönetin.',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
              ],
            ),
          ),

          // Orta Kısım: Finansal hesaplar özeti
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: [
                  AccountCard(accountName: 'Banka Hesabı', balance: 4500.75),
                  AccountCard(accountName: 'Yatırım Hesabı', balance: 15000.25),
                  AccountCard(accountName: 'Nakit', balance: 500.0),
                ],
              ),
            ),
          ),

          // Alt Kısım: Hızlı işlem butonları
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: ActionButton(
                    icon: Icons.add,
                    label: 'Harcama Ekle',
                    onPressed: () {
                      // İşlem ekleme kodu buraya gelecek
                    },
                  ),
                ),
                SizedBox(width: 16),
                Flexible(
                  flex: 1,
                  child: ActionButton(
                    icon: Icons.send,
                    label: 'Para Gönder',
                    onPressed: () {
                      // Para gönderme kodu buraya gelecek
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AccountCard extends StatelessWidget {
  final String accountName;
  final double balance;

  const AccountCard({
    required this.accountName,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          accountName,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Bakiye: ₺${balance.toStringAsFixed(2)}',
          style: TextStyle(fontSize: 16, color: Colors.grey[700]),
        ),
        leading:
            Icon(Icons.account_balance_wallet, size: 32, color: Colors.blue),
      ),
    );
  }
}

// Hızlı İşlem Butonu Widget'ı
class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const ActionButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 24),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      ),
    );
  }
}
