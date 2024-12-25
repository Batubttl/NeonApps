import 'package:flutter/material.dart';

class Mobx extends StatefulWidget {
  const Mobx({super.key});

  @override
  State<Mobx> createState() => _MobxState();
}

bool isLocked = true;

class _MobxState extends State<Mobx> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: isLocked ? Colors.red : Colors.green,
          title: const Text('Door App'),
        ),
        body: Center(
            child: Column(
          children: [
            Icon(isLocked ? Icons.lock : Icons.lock_open,
                size: 100, color: isLocked ? (Colors.red) : (Colors.green)),
            const _NormalSizedBox(),
            Text(
              isLocked ? 'Kilidi Açın' : 'Kapıyı kilitleyin',
              style: const TextStyle(fontSize: 50),
            ),
            const _NormalSizedBox(),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    isLocked = !isLocked;
                  });
                },
                child: Text(isLocked
                    ? 'Kilidi açmak için basabilirsiniz'
                    : 'Kapının kilidini kapatın lütfen'))
          ],
        )));
  }
}

class _NormalSizedBox extends StatelessWidget {
  const _NormalSizedBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
    );
  }
}
