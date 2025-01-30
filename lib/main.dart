import 'package:ecocoleta/features/auth/screens/login_screen.dart';
import 'package:ecocoleta/helper/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const EcoColetaApp());
}

class EcoColetaApp extends StatelessWidget {
  const EcoColetaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: RouteHelper.routes,
      locale: const Locale('pt', 'BR'), 
      fallbackLocale: const Locale('en', 'US'),
      home: LoginScreen(), 
    );
  }
}