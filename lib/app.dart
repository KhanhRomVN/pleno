import 'package:flutter/material.dart';
import 'config/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      title: 'Flutter eCommerce',
      initialRoute: '/',
      routes: routes,
    );
  }
}
