import 'package:flutter/material.dart';

class AccInfoWidgets {
  static Widget profileTile(String label, IconData icon, String text, {bool isLast = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label above the tile
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          // The row with icon and text
          Row(
            children: [
              Icon(icon, color: Colors.grey),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ),
            ],
          ),
          // Divider only if not the last item
          if (!isLast) const Divider(height: 24),
        ],
      ),
    );
  }
}
