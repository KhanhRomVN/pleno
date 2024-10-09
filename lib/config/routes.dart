import 'package:flutter/material.dart';
import '../presentation/pages/home_page.dart';
import '../presentation/pages/login_page.dart';
import '../presentation/pages/register_page.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => HomePage(),
  '/login': (context) => LoginPage(),
  '/register': (context) => RegisterPage(),
};
