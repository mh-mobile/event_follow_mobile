import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'my_app.dart';
import 'ui/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

