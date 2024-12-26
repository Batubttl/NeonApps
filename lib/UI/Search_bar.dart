import 'package:flutter/material.dart';
import 'package:yeni_neonapps/UI/DataTable/data_one.dart';

class MickeyAndMiniChallenge extends StatefulWidget {
  const MickeyAndMiniChallenge({super.key});

  @override
  State<MickeyAndMiniChallenge> createState() => _MickeyAndMiniChallengeState();
}

class _MickeyAndMiniChallengeState extends State<MickeyAndMiniChallenge> {
  String searchQuery = '';
  String searchBy = 'name';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Person List"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: const InputDecoration(
                  labelText: 'Search', border: OutlineInputBorder()),
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
            ),
          ),
          ToggleButtons(
            isSelected: [searchBy == 'name', searchBy == 'surname'],
            onPressed: (index) {
              setState(() {
                searchBy = index == 0 ? 'name' : 'surname';
              });
            },
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text('Name'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text('Surname'),
              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Surname')),
                  DataColumn(label: Text('Age')),
                  DataColumn(label: Text('Hometown')),
                  DataColumn(label: Text('Mail')),
                ],
                rows: passengers.where((passenger) {
                  final value =
                      searchBy == 'name' ? passenger.name : passenger.surname;
                  return value.toLowerCase().contains(searchQuery);
                }).map((passenger) {
                  return DataRow(
                    cells: [
                      DataCell(Text(passenger.name)),
                      DataCell(Text(passenger.surname)),
                      DataCell(Text(passenger.age.toString())),
                      DataCell(Text(passenger.homeTown)),
                      DataCell(Text(passenger.mail)),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
