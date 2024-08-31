import 'package:flutter/material.dart';
import 'cropInputVerification.dart';
import 'home.dart';
import '../components/button.dart';
import '../components/text_field.dart';

class CropInputPage extends StatefulWidget {
  const CropInputPage({super.key});

  @override
  _CropInputPageState createState() => _CropInputPageState();
}

class _CropInputPageState extends State<CropInputPage> {
  final TextEditingController cropNameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  int points = 200;

  void _navigateToVerificationPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VerificationPage(
          cropName: cropNameController.text,
          quantity: quantityController.text,
          price: priceController.text,
        ),
      ),
    );

    if (result == true) {
      setState(() {
        points += 5; // Increment points by 5
      });

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => Home(
            cropName: cropNameController.text,
            quantity: quantityController.text,
            price: priceController.text,
            showPopup: true,
            points: points,
          ),
        ),
            (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Center(
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Points: ',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        TextSpan(
                          text: '$points',
                          style: const TextStyle(
                            color: Colors.purple,
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
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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

                  Center(
                    child: MyButton(
                      text: 'Submit',
                      onTap: _navigateToVerificationPage,
                      height: 45.0,
                      width: 120.0,
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

