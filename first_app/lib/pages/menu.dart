import 'package:flutter/material.dart';
import 'first.dart';
import 'second.dart';
import 'third.dart';
import 'fourth.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Выбор макетов')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const FirstScreen())),
                child: const Text('Макет 1 - Простой'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SecondScreen())),
                child: const Text('Макет 2 - Простой'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ThirdScreen())),
                child: const Text('Макет 3 - Сложный'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const FourthScreen())),
                child: const Text('Макет 4 - Сложный'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}