import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:x_o_game/homepage.dart';
import 'package:x_o_game/onboarding_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? seen = prefs.getBool('seenOnboarding') ?? false;

  runApp(XOGame(seenOnboarding: seen));
}

class XOGame extends StatelessWidget {
  final bool seenOnboarding;
  const XOGame({super.key, required this.seenOnboarding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: seenOnboarding ? Homepage() : OnboardingPage(),
    );
  }
}
