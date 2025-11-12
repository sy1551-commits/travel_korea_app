import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'map_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final raw = await rootBundle.loadString('assets/json/info.json');
  final Map<String, dynamic> info = jsonDecode(raw);
  runApp(MyApp(info: info));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.info});
  final Map<String, dynamic> info;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Travel Korea App', home: const MapScreen());
  }
}
