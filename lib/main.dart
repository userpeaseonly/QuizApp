import 'package:flutter/material.dart';
import 'package:quiz_app1/ui/first_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FirstScreen(),
    theme: ThemeData(
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
    ),
  ));
}
