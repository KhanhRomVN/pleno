import 'package:flutter/material.dart';
import '../presentation/pages/home/home_page.dart';
import '../presentation/pages/product/product_list_page.dart';
import '../presentation/pages/cart/cart_page.dart';
import '../presentation/pages/account/account_page.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => HomePage(),
  '/products': (context) => ProductListPage(),
  '/cart': (context) => CartPage(),
  '/account': (context) => AccountPage(),
};