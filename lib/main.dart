import 'package:project_reform_v_demo/pages/logIn.dart';
import 'package:project_reform_v_demo/pages/userType.dart';
import 'package:project_reform_v_demo/themes/theme_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const UserType(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
