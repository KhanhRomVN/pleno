import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:shared_preferences_web/shared_preferences_web.dart';
import 'presentation/pages/login_page.dart';
import 'app.dart';

void main() {
  SharedPreferencesPlugin.registerWith(null);
  runApp(MyApp());
}
