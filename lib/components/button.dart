import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final double height;
  final double width;

  const MyButton({
    super.key,
    required this.text,
    required this.onTap,
    this.height = 50.0,  // Default height
    this.width = 150.0,  // Default width
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: height,
        width: width,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26, // Shadow color
                offset: Offset(4, 4),  // Shadow position
                blurRadius: 8,         // Shadow blur radius
              ),
            ],
            border: Border.all(
              color: Colors.blueAccent,  // Border color
              width: 2.0,             // Border thickness
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
