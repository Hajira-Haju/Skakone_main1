import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SalesLeadWidgets{
  static Widget buildDetailTile(String title, String value) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(value),
      dense: true,
    );
  }
}