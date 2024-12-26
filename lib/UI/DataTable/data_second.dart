import 'package:flutter/material.dart';
import 'package:yeni_neonapps/UI/DataTable/data_one.dart';

class PassengerDetailPage extends StatelessWidget {
  final Passenger passenger;
  const PassengerDetailPage({Key? key, required this.passenger})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${passenger.name}' '${passenger.surname}'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name : ${passenger.name}'),
            Text('Name : ${passenger.surname}'),
            Text('Name : ${passenger.age}'),
            Text('Name : ${passenger.homeTown}'),
            Text('Name : ${passenger.mail}'),
          ],
        ),
      ),
    );
  }
}