import 'package:flutter/material.dart';
import 'package:x_o_game/twoplayer.dart';

class EnterNames extends StatefulWidget {
  @override
  _EnterNamesState createState() => _EnterNamesState();
}
class _EnterNamesState extends State<EnterNames> {
  TextEditingController player1Controller = TextEditingController();
  TextEditingController player2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 32, 126, 35),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Enter Player Names',
          style: TextStyle(color: Colors.green),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: player1Controller,
              decoration: InputDecoration(
                labelText: "Player 1 Name",
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: player2Controller,
              decoration: InputDecoration(
                labelText: "Player 2 Name",
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                final player1Name = player1Controller.text.trim().isEmpty
                    ? "Player 1"
                    : player1Controller.text.trim();
                final player2Name = player2Controller.text.trim().isEmpty
                    ? "Player 2"
                    : player2Controller.text.trim();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TwoPlayer(
                      player1Name: player1Name,
                      player2Name: player2Name,
                    ),
                  ),
                );
              },
              child: Text("Start Game"),
            ),
          ],
        ),
      ),
    );
  }
}
