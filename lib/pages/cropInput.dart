import 'package:project_reform_v_demo/components/button.dart';
import 'package:project_reform_v_demo/components/text_field.dart';
import 'package:flutter/material.dart';

import 'cropInputVerification.dart';

class CropInputPage extends StatefulWidget {
  //final VoidCallback onSubmit;
  const CropInputPage({super.key});
  @override
  _CropInputPageState createState() => _CropInputPageState();
}

class _CropInputPageState extends State<CropInputPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController cropNameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  int points = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Center( // Centering the "Farmer's Buying and Selling" text
              child: Text(
                "Farmer's Buying and Selling",
                style: TextStyle(
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end, // Aligning to the right
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Points: ',
                          style: TextStyle(
                            color: Colors.blue, // Color for "Points"
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        TextSpan(
                          text: '$points',
                          style: const TextStyle(
                            color: Colors.purple, // Color for points value
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Adding horizontal padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Aligning the following items to the left
                children: [
                  Text(
                    "Crop Name",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  MyTextField(
                    controller: cropNameController,
                    hintText: "Enter Crop Name",
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),

                  const SizedBox(height: 10),
                  Text(
                    "Quantity",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  MyTextField(
                    controller: quantityController,
                    hintText: "Enter Quantity",
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),

                  const SizedBox(height: 10),
                  Text(
                    "Price",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  MyTextField(
                    controller: priceController,
                    hintText: "Enter Price",
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),

                  const SizedBox(height: 10),
                  Center(
                    child: MyButton(
                      text: 'Submit',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => VerificationPage()),
                        );
                      },
                      height: 45.0,  // Custom height
                      width: 120.0,  // Custom width
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}