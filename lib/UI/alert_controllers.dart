import 'package:flutter/material.dart';

class AlertControlView extends StatelessWidget {
  const AlertControlView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Adventure'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Alert Dialog'),
                    content: Text('This is an alert dialog. '),
                  ),
                );
              },
              child: Text('Uyarı göster - 1 Buton yok')),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Hello fellas'),
                    content: Text('Fellas need some coffee to calm down'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            print("Clicked Confirm");
                          },
                          child: Text('Confirm')),
                    ],
                  ),
                );
              },
              child: Text('Fellas Buton Warning')),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Just Do IT!'),
                    content: Text('Because you are unbeatable '),
                    actions: [
                      TextButton(
                          onPressed: () {
                            print('You did it!');
                          },
                          child: Text('Confirm')),
                      TextButton(
                          onPressed: () {
                            print('You succeeded!');
                          },
                          child: Text('Cancel')),
                    ],
                  ),
                );
              },
              child: Text('Sports Information Button!')),
          SizedBox(
            height: 10,
          ),
          // 4. Buton: TextField içeren alert
          ElevatedButton(
              onPressed: () {
                TextEditingController _controller = TextEditingController();
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Give us Some Info About You!'),
                    content: Column(
                      mainAxisSize:
                          MainAxisSize.min, // Alert'in boyutunu sınırlamak için
                      children: [
                        TextField(
                          controller: _controller,
                          decoration:
                              InputDecoration(hintText: 'Enter your name!'),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          print("This is: ${_controller.text}");
                        },
                        child: Text('Show me the Name!'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Enter Your Info')),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => Column(
                    children: [
                      ListTile(
                        title: Text('Share Images'),
                        onTap: () {
                          print('Options 1 Selected');
                        },
                      ),
                      ListTile(
                        title: Text('Share Files'),
                        onTap: () {
                          print('Options 2 Selected ! ');
                        },
                      )
                    ],
                  ),
                );
              },
              child: Text("Show Action Sheet")),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              print("Paylaşım yapılıyor...");
            },
            child: Text("Activity Controller Göster"),
          )
        ],
      ),
    );
  }
}
