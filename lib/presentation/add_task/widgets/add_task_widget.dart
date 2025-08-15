import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTaskWidgets{
  static Widget buildLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  static Widget buildInputField(TextEditingController controller, String hint, {int maxLines = 1}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
    );
  }

  static Widget buildDropdown(
      List<String> items,
      String? selectedValue,
      String hint,
      ValueChanged<String?> onChanged,
      ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        value: selectedValue,
        hint: Text(hint),
        underline: const SizedBox(),
        onChanged: onChanged,
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
      ),
    );
  }
  static Widget buildAttachmentPicker({required VoidCallback onPick, String? fileName}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildLabel('Attachment'),
        GestureDetector(
          onTap: onPick,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  fileName ?? 'Choose file',
                  style: TextStyle(
                    color: fileName != null ? Colors.black : Colors.grey,
                    fontSize: 16,
                  ),
                ),
                const Icon(Icons.attach_file, color: Colors.grey),
              ],
            ),
          ),
        ),
      ],
    );
  }
  static Widget buildCheckboxes({
    required bool repeatedIncident,
    required bool systemDown,
    required ValueChanged<bool?> onRepeatedChanged,
    required ValueChanged<bool?> onSystemDownChanged,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(value: repeatedIncident, onChanged: onRepeatedChanged),
            const Text("Repeated Incident"),
          ],
        ),
        Row(
          children: [
            Checkbox(value: systemDown, onChanged: onSystemDownChanged),
            const Text("System Down"),
          ],
        ),
      ],
    );
  }
  static Widget buildDatePicker(DateTime? selectedDate, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedDate == null
                  ? 'Select Date'
                  : '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
              style: const TextStyle(fontSize: 15),
            ),
            const Icon(Icons.calendar_month_outlined, size: 20, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}