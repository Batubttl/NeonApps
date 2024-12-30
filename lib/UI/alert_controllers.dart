import 'package:flutter/material.dart';

class AlertControlView extends StatelessWidget {
  const AlertControlView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Adventure'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                    title: Text('Alert Dialog'),
                    content: Text('This is an alert dialog. '),
                  ),
                );
              },
              child: const Text('Uyarı göster - 1 Buton yok')),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Hello fellas'),
                    content: const Text('Fellas need some coffee to calm down'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            print("Clicked Confirm");
                          },
                          child: const Text('Confirm')),
                    ],
                  ),
                );
              },
              child: const Text('Fellas Buton Warning')),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Just Do IT!'),
                    content: const Text('Because you are unbeatable '),
                    actions: [
                      TextButton(
                          onPressed: () {
                            print('You did it!');
                          },
                          child: const Text('Confirm')),
                      TextButton(
                          onPressed: () {
                            print('You succeeded!');
                          },
                          child: const Text('Cancel')),
                    ],
                  ),
                );
              },
              child: const Text('Sports Information Button!')),
          const SizedBox(
            height: 10,
          ),
          // 4. Buton: TextField içeren alert
          ElevatedButton(
              onPressed: () {
                TextEditingController controller = TextEditingController();
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Give us Some Info About You!'),
                    content: Column(
                      mainAxisSize:
                          MainAxisSize.min, // Alert'in boyutunu sınırlamak için
                      children: [
                        TextField(
                          controller: controller,
                          decoration:
                              const InputDecoration(hintText: 'Enter your name!'),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          print("This is: ${controller.text}");
                        },
                        child: const Text('Show me the Name!'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Enter Your Info')),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => Column(
                    children: [
                      ListTile(
                        title: const Text('Share Images'),
                        onTap: () {
                          print('Options 1 Selected');
                        },
                      ),
                      ListTile(
                        title: const Text('Share Files'),
                        onTap: () {
                          print('Options 2 Selected ! ');
                        },
                      )
                    ],
                  ),
                );
              },
              child: const Text("Show Action Sheet")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              print("Paylaşım yapılıyor...");
            },
            child: const Text("Activity Controller Göster"),
          )
        ],
      ),
    );
  }
}
