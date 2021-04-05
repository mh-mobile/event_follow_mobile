import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dot_env;
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'my_app.dart';

final firebaseAuth = FirebaseAuth.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dot_env.load();
  runApp(ProviderScope(child: MyApp()));
}
