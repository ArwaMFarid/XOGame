import 'package:flutter/material.dart';

class IntroPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 32, 126, 35),
        body: Center(
          child: Image.asset(
            'assets/images/WhatsApp Image 2025-04-23 at 23.09.35_f12b4908.jpg',
            width: 400,
            height: 800,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
