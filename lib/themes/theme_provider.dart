import 'package:flutter/material.dart';
import 'package:project_reform_v_demo/themes/dark_mode.dart';
import 'package:project_reform_v_demo/themes/light_mode.dart';

class ThemeProvider with ChangeNotifier{

  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }
  void toggleTheme(){
    if(_themeData == lightMode){
      themeData = darkMode;
  }
    else{
      themeData = lightMode;
  }
}
}