import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DreamDestinationsApp extends StatefulWidget {
  const DreamDestinationsApp({super.key});

  @override
  State<DreamDestinationsApp> createState() => _DreamDestinationsAppState();
}

class _DreamDestinationsAppState extends State<DreamDestinationsApp> {
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _timeVisitedController = TextEditingController();
  bool _visited = false;

  String _savedplace = "Not yet";
  final int _savedTime = 0;
  bool _savedVisitedTime = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('place', _placeController.text);
    await prefs.setInt(
        'timesVisited', int.tryParse(_timeVisitedController.text) ?? 0);
    await prefs.setBool('visited', _visited);

    _loadData(); // Update UI
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedplace = prefs.getString('place') ?? "No place saved";
      _savedVisitedTime = (prefs.getInt('timesVisited') ?? 0) as bool;
      _visited = prefs.getBool('visited') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TravelApp"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Text("Saved Place : $_savedplace\n"
                "Saved Place : $_savedTime \n"
                "Saved Place : $_savedVisitedTime\n"),
            TextField(
              controller: _placeController,
              decoration: const InputDecoration(
                  labelText:
                      ("What is the name of the place you want to visit?")),
            ),
            TextField(
              controller: _timeVisitedController,
              decoration: const InputDecoration(
                  labelText: "How many times have you visited this place?"),
              keyboardType: TextInputType.number,
            ),
            SwitchListTile(
              title: const Text("Have you visited this place?"),
              value: _savedVisitedTime,
              onChanged: (bool value) {
                setState(() {
                  _savedVisitedTime = value;
                });
              },
            ),
            Row(
              children: [
                const Text("Have you been this place before ? "),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: _saveData,
                  child: const Text("Save Data"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
