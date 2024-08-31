import 'package:flutter/material.dart';
import 'package:project_reform_v_demo/pages/home.dart';
import 'package:project_reform_v_demo/pages/logIn.dart';
import '../components/button.dart';
import '../components/text_field.dart';

class FarmerRegister extends StatefulWidget {
  const FarmerRegister({super.key});

  @override
  State<FarmerRegister> createState() => _FarmerRegisterState();
}

class _FarmerRegisterState extends State<FarmerRegister> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const Text(
                  "Let's create an account",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Name | নাম",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      MyTextField(
                        controller: nameController,
                        hintText: "Enter name | নাম প্রবেশ করুন",
                        obscureText: false,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Email | ইমেইল",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      MyTextField(
                        controller: emailController,
                        hintText: "Enter email | ইমেইল প্রবেশ করুন",
                        obscureText: false,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Password | পাসওয়ারড",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      MyTextField(
                        controller: passController,
                        hintText: "Enter password | পাসওয়ারড প্রবেশ করুন",
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Confirm Password | কনফার্ম পাসওয়ারড",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      MyTextField(
                        controller: confirmPassController,
                        hintText: "Re-enter password | পাসওয়ারড পুন্রায় প্রবেশ করুন",
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: MyButton(
                          text: 'Register',
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Success'),
                                  content: const Text('Registration Successful!'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (context) => const Home()),
                                        );
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );

                          },
                          height: 45,
                          width: 120,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already an user?",
                            style: TextStyle(color: Colors.blue),
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Login()),
                              );
                            },
                            child: const Text(
                              "Log in!",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
