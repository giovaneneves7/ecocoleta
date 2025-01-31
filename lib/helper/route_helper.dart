import 'dart:convert';
import 'package:ecocoleta/features/auth/screens/login_screen.dart';
import 'package:ecocoleta/features/auth/screens/signup_screen.dart';
import 'package:ecocoleta/features/home/screens/home_screen.dart';
import 'package:get/get.dart';

/**
* Helper com todas as rotas para telas da aplicação.
*
* @author Giovane Neves
* @since v0.0.1
*/
class RouteHelper{

  static const String login = '/login';
  static const String home = '/home';
  static const String signup = '/signup';

  static String getLoginScreen() => login;
  static String getHomeScreen() => home;
  static String getSignupScreen() => signup;

  // Registro de rotas [ Adicionar todas as rotas do app aqui ] 
  static List<GetPage> routes = [
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: signup, page: () => SignupScreen())
  ];

}