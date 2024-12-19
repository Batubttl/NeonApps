// ignore: file_names
import 'package:flutter/material.dart';

class SpecialButton extends StatefulWidget {
  const SpecialButton({super.key});

  @override
  State<SpecialButton> createState() => _SpecialButtonState();
}

bool isHere = true;
bool isYellow = true;
String dropDownvalue = 'Select Action';

List<String> callSheriff = [
  'Select Action',
  'Call for backup',
  'Warning Issue'
];

class _SpecialButtonState extends State<SpecialButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('Saloon Daily Specials'),
      ),
      body: Center(
          child: Column(children: [
        const SizedBox(
          height: 20,
        ),
        Container(
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.red, Colors.blueAccent],
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      offset: Offset(3, 3))
                ],
                image: const DecorationImage(
                    image: AssetImage('assets/western.jpeg'),
                    fit: BoxFit.cover),
                border: Border.all(color: Colors.blue, width: 2)),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  minimumSize: const Size(100, 100)),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Daily specials'),
                        content: const Text(
                          'Todays Specials Beer and Popcorn!!',
                        ),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Close'))
                        ],
                      );
                    });
              },
              child: const Text(
                'Daily Specials',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(color: Colors.black26),
                    ]),
              ),
            )),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: isYellow ? Colors.yellow : Colors.purple),
            onPressed: () {
              setState(() {
                isYellow = !isYellow;
              });
            },
            child: Text(
              isYellow ? 'Make me Purple' : 'Make me Yellow!',
              style: const TextStyle(fontSize: 20, color: Colors.black),
            )),
        const SizedBox(
          height: 20,
        ),
        DropdownButton(
            items: callSheriff
                .map((String helpCenter) => DropdownMenuItem(
                      child: Text(helpCenter),
                      value: helpCenter,
                    ))
                .toList(),
            value: dropDownvalue,
            onChanged: ((String? newHelp) {
              setState(() {
                dropDownvalue = newHelp!;
              });
              if (newHelp == 'Call for backup') {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('BackUp is coming!')));
              } else if (newHelp == 'Warning Issue') {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Issued  Already Warning')));
              }
            })),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: isHere ? Colors.red : Colors.green),
            onPressed: () {
              setState(() {
                isHere = !isHere;
                isYellow = !isYellow;
              });
            },
            child: Text(
                isHere ? 'He is here!!!' : 'he is not here so u can be relax '))
      ])),
    );
  }
}
