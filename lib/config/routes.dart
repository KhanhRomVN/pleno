import 'package:flutter/material.dart';
import '../presentation/pages/home_page.dart';
import '../presentation/pages/login_page.dart';
import '../presentation/pages/register_page.dart';
import '../presentation/pages/social_page.dart';
import '../presentation/pages/cart_page.dart';
import '../presentation/pages/setting_page.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => HomePage(),
  '/login': (context) => LoginPage(),
  '/register': (context) => RegisterPage(),
  '/social': (context) => SocialPage(),
  '/cart': (context) => CartPage(),
  '/setting': (context) => SettingPage(),
};
