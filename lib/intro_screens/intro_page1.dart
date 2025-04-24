import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 32, 126, 35),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 100),
              child: Text(
                "Tic",
                style: TextStyle(
                  fontSize: 50,
                  fontFamily: 'Pacifico-Regular',
                  color: Color.fromARGB(255, 255, 254, 254),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 150),
              child: Text(
                "Tac",
                style: TextStyle(
                  fontSize: 50,
                  fontFamily: 'Pacifico-Regular',
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 200),
              child: Text(
                "Teo",
                style: TextStyle(
                  fontSize: 50,
                  fontFamily: 'Pacifico-Regular',
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
