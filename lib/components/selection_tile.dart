import 'package:flutter/material.dart';

class MySelectionTile extends StatelessWidget {
  final String title;
  final String value;
  final String groupValue;
  final void Function(String?)? onChanged;
  final double height;
  final double width;

  const MySelectionTile({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.height = 60.0,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.green,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(12),  // Rounded corners
        ),
        child: RadioListTile(
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: Colors.indigo,
        ),
      ),
    );
  }
}
