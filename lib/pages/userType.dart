import 'package:flutter/material.dart';
import 'package:project_reform_v_demo/components/button.dart';
import 'package:project_reform_v_demo/components/selection_tile.dart';



import 'farmerRegister.dart';
import 'logIn.dart';

class UserType extends StatefulWidget {
  const UserType({super.key});

  @override
  State<UserType> createState() => _UserTypeState();
}

class _UserTypeState extends State<UserType> {
  String selectedUserType = "";

  void navigateToRegisterPage() {
    if (selectedUserType == "Farmer") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const FarmerRegister()));
    } /*else if (selectedUserType == "Company") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const CompanyRegister()));
    } else if (selectedUserType == "Shopkeeper") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const ShopkeeperRegister()));
    } else if (selectedUserType == "General People") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const GeneralPeopleRegister()));
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                "User Type Selection | ব্যবহারকারী ধরণ বাছাই করুন",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              MySelectionTile(
                title: "Farmer | কৃষক",
                value: "Farmer",
                groupValue: selectedUserType,
                onChanged: (value) {
                  setState(() {
                    selectedUserType = value!;
                  });
                },
                height: 80,
                width: 300,
              ),
              const SizedBox(height: 10),
              MySelectionTile(
                title: "Company | কোম্পানি",
                value: "Company",
                groupValue: selectedUserType,
                onChanged: (value) {
                  setState(() {
                    selectedUserType = value!;
                  });
                },
                height: 80,
                width: 300,
              ),
              const SizedBox(height: 10),
              MySelectionTile(
                title: "Shopkeeper | দোকানদার",
                value: "Shopkeeper",
                groupValue: selectedUserType,
                onChanged: (value) {
                  setState(() {
                    selectedUserType = value!;
                  });
                },
                height: 80,
                width: 300,
              ),
              const SizedBox(height: 10),
              MySelectionTile(
                title: "General People | সাধারণ জনগণ",
                value: "General People",
                groupValue: selectedUserType,
                onChanged: (value) {
                  setState(() {
                    selectedUserType = value!;
                  });
                },
                height: 80,
                width: 300,
              ),
              const SizedBox(height: 20),
              MyButton(
                text: "Submit",
                onTap: navigateToRegisterPage,
                height: 45.0,
                width: 120.0,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.blue),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                    },
                    child: const Text(
                      "Log in!",
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
