import 'package:flutter/material.dart';
import 'package:yeni_neonapps/UI/DataTable/data_second.dart';

class FirstViewData extends StatefulWidget {
  const FirstViewData({super.key});

  @override
  State<FirstViewData> createState() => _FirstViewDataState();
}

final List<Passenger> passengers = [
  Passenger(
      name: "Yaren",
      surname: "Gokmen",
      age: 23,
      homeTown: "Mexico City",
      mail: "yarengokmen@gmail.com"),
  Passenger(
      name: "Batuhan",
      surname: "Battal",
      age: 37,
      homeTown: "Mexico City",
      mail: "batubattal@gmail.com"),
  Passenger(
      name: "Ahmet",
      surname: "Samsun",
      age: 49,
      homeTown: "Samsun",
      mail: "ahmetsamsun@gmail.com"),
  Passenger(
      name: "Arif",
      surname: "Kısaç",
      age: 37,
      homeTown: "Ordu",
      mail: "arifkısac@gmail.com"),
  Passenger(
      name: "Merve",
      surname: "Ozak",
      age: 23,
      homeTown: "İstanbul",
      mail: "ozakmerve@gmail.com"),
  Passenger(
      name: "Atlas",
      surname: "Özak",
      age: 4,
      homeTown: "İstanbul",
      mail: "atlasozak@gmail.com"),
  Passenger(
      name: "Ezgi",
      surname: "Aslan",
      age: 41,
      homeTown: "Manisa",
      mail: "ezgiaslan@gmail.com"),
  Passenger(
      name: "Mehmet",
      surname: "Akın",
      age: 15,
      homeTown: "Bitlis",
      mail: "mehmetakin@gmail.com"),
  Passenger(
      name: 'Mini',
      surname: 'Mouse',
      age: 32,
      homeTown: 'Disneyland',
      mail: 'minidisney@gmail.com'),
  Passenger(
      name: 'Mickey',
      surname: 'Mouse',
      age: 26,
      homeTown: 'Disneyland',
      mail: 'mickeydisney@gmail.com')
];

class _FirstViewDataState extends State<FirstViewData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Passenger List"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text("Name")),
            DataColumn(label: Text("Surname")),
            DataColumn(label: Text("Age")),
            DataColumn(label: Text("HomeTown")),
            DataColumn(label: Text("Mail")),
          ],
          rows: passengers.map((passenger) {
            return DataRow(cells: [
              DataCell(
                Text(passenger.name),
                onTap: () => _navigateToDetailPage(context, passenger),
              ),
              DataCell(
                Text(passenger.surname),
                onTap: () => _navigateToDetailPage(context, passenger),
              ),
              DataCell(
                Text(passenger.age.toString()),
                onTap: () => _navigateToDetailPage(context, passenger),
              ),
              DataCell(
                Text(passenger.homeTown),
                onTap: () => _navigateToDetailPage(context, passenger),
              ),
              DataCell(
                Text(passenger.mail),
                onTap: () => _navigateToDetailPage(context, passenger),
              ),
            ]);
          }).toList(),
        ),
      ),
    );
  }

  void _navigateToDetailPage(BuildContext context, Passenger passenger) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PassengerDetailPage(passenger: passenger),
        ));
  }
}

class Passenger {
  final String name;
  final String surname;
  final int age;
  final String homeTown;
  final String mail;
  Passenger({
    required this.name,
    required this.surname,
    required this.age,
    required this.homeTown,
    required this.mail,
  });
}
