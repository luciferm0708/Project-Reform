import 'package:flutter/material.dart';
import 'package:project_reform_v_demo/components/text_field.dart';
import 'package:project_reform_v_demo/pages/cropInput.dart';
import 'package:project_reform_v_demo/pages/userType.dart';

import '../components/button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Icon(
                Icons.lock_open_rounded,
                size: 72,
                color: Colors.blue,
              ),
              const SizedBox(height: 50),
              const Text(
                "Welcome | স্বাগতম",
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
                    const SizedBox(height: 10),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot Password? | পাসওয়ারড ভুলে গিয়েছেন?",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: MyButton(
                        text: 'Log in!',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const CropInputPage()),
                          );
                        },
                        height: 45.0,  // Custom height
                        width: 120.0,  // Custom width
                      ),
                    ),
                    const SizedBox(height: 10),

                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Not an user? | ব্যবহারকারী নয়?",
                          style: TextStyle(color: Colors.blue),
                        ),
                        const SizedBox(width: 5),

                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const UserType()),
                            );
                          },
                          child: const Text(
                            "Register now! | নিবন্ধন করুন!",
                            style: TextStyle(color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
