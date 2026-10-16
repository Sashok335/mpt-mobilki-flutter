import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF036A6C), 
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                children: [
                  SizedBox(height: 40),
                  Text('medinow', style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('Meditate With Us!', style: TextStyle(color: Colors.white70, fontSize: 16)),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity, height: 56,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                      onPressed: () {},
                      child: const Text('Sign in with Apple', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity, height: 56,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFCAF0F8), foregroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                      onPressed: () {},
                      child: const Text('Continue with Email or Phone', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Continue With Google', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
              SizedBox(
                height: 220,
                child: Image.asset('assets/images/meditation_guy.png', fit: BoxFit.contain), 
              ),
            ],
          ),
        ),
      ),
    );
  }
}