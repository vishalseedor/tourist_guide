import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:touirst_guide_project/Screens/LoginScreen/loginscreen.dart';
import 'package:touirst_guide_project/Screens/homescreen.dart';
import 'package:touirst_guide_project/onboard.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.abhayaLibreTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const NewLoginScreen()
    );
  }
}


