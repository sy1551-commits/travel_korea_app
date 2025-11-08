import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'map_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final raw = await rootBundle.loadString('assets/json/info.json');
  final Map<String, dynamic> info = jsonDecode(raw); // 도시명 → List
  runApp(MyApp(info: info));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.info});
  final Map<String, dynamic> info;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MapScreen(),
    );
  }
}
