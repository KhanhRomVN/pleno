import 'package:flutter/material.dart';
import '../presentation/pages/home_page.dart';
import '../presentation/pages/login_page.dart';
import '../presentation/pages/register_page.dart';
import '../presentation/pages/shop_page.dart';
import '../presentation/pages/sell_page.dart';
import '../presentation/pages/setting_page.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => HomePage(),
  '/login': (context) => LoginPage(),
  '/register': (context) => RegisterPage(),
  '/shop': (context) => ShopPage(),
  '/sell/product': (context) => SellPage(),
  '/sell/order': (context) => SellPage(),
  '/sell/other': (context) => SellPage(),
  '/setting': (context) => SettingPage(),
};
