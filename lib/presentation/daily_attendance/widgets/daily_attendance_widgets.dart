import 'package:flutter/material.dart';

class DailyAttendanceWidget extends StatelessWidget {
  final String label;
  final String value;

  const DailyAttendanceWidget({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4), // shadow color
              spreadRadius: 3, // how far the shadow spreads
              blurRadius: 4, // softness of the shadow
              offset: const Offset(1, 2), // horizontal & vertical movement
            ),
          ],
        ),
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}