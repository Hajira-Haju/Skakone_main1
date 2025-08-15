import 'package:flutter/material.dart';
import 'package:skakone/core/constants/const_data.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade50,
      appBar: AppBar(
        backgroundColor: ConstData.prmClr,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text('No Notifications'),
      ),
    );
  }
}
