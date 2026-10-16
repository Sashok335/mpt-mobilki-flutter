import 'package:flutter/material.dart';
import 'pages/menu.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Выкл дебага
      title: 'Flutter Multi-Screen App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MenuScreen(),
    );
  }
}