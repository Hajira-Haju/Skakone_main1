import 'package:flutter/material.dart';
import 'package:skakone/core/constants/const_data.dart';

class TeamLocationDetailPage extends StatelessWidget {
  final String teamName;
  final String location;

  const TeamLocationDetailPage({
    required this.teamName,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstData.prmClr,
          foregroundColor: Colors.white,
          title: Text('$teamName Details',)
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Team Name:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(teamName, style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text(
              'Location:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(location, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}