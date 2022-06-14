
import 'package:flutter/cupertino.dart';
import '/src/home/pages/home_page.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/home': (context) => const HomePage(),
  };


  static const homeRoute = "/home";
}