import 'package:ecocoleta/features/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EcoColetaApp());
}

class EcoColetaApp extends StatelessWidget {
  const EcoColetaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoColeta',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}