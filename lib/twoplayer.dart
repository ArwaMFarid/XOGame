import 'package:flutter/material.dart';
import 'package:x_o_game/homepage.dart';

class TwoPlayer extends StatefulWidget {
  TwoPlayer({
    Key? key,
    this.player1Name = "Player 1",
    this.player2Name = "Player 2",
  }) : super(key: key);
  String player1Name;
  String player2Name;

  @override
  State<TwoPlayer> createState() => _TwoPlayerState();
}

class _TwoPlayerState extends State<TwoPlayer> {
  int pointplayer1 = 0;
  int pointplayer2 = 0;
  List<String> board = List.filled(9, "");
  bool isPlayer1 = true;
  bool gameOver = false;

  void handleTap(int index) {
    if (board[index] == "" && !gameOver) {
      setState(() {
        board[index] = isPlayer1 ? "O" : "X";
        isPlayer1 = !isPlayer1;
      });

      String winner = checkWinner(board);

      if (winner != "") {
        setState(() {
          gameOver = true;
          if (winner == "O") {
            pointplayer1++;
            winner = widget.player1Name;
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Text("$winner is Win 😉"),
                  actions: [
                    TextButton(
                      child: Text("Done"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          } else {
            pointplayer2++;
            winner = widget.player2Name;
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Text("$winner is Win 😉"),
                  actions: [
                    TextButton(
                      child: Text("Done"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }
        });

        Future.delayed(Duration(seconds: 1), () {
          resetBoard();
        });
      } else if (!board.contains("")) {
        setState(() {
          gameOver = true;
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Text("Nobody Wins – It’s a Tie!"),
                actions: [
                  TextButton(
                    child: Text("Done"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        });

        Future.delayed(Duration(seconds: 1), () {
          resetBoard();
        });
      }
    }
  }

  void resetBoard() {
    setState(() {
      board = List.filled(9, "");
      isPlayer1 = true;
      gameOver = false;
    });
  }

  String checkWinner(List<String> board) {
    for (var pattern in winningPatterns) {
      String a = board[pattern[0]];
      String b = board[pattern[1]];
      String c = board[pattern[2]];
      if (a != "" && a == b && b == c) {
        return a;
      }
    }
    return "";
  }

  List<List<int>> winningPatterns = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("X_O_Game"),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
          backgroundColor: const Color.fromARGB(255, 32, 126, 35),
        ),
        body: Column(
          children: [
            const SizedBox(height: 5, width: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.player1Name,
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                ),
                SizedBox(width: 100),
                Text(
                  widget.player2Name,
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$pointplayer1",
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                ),

                SizedBox(width: 180),
                Text(
                  "$pointplayer2",
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            GridView.builder(
              shrinkWrap: true,
              itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => handleTap(index),
                  child: Container(
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(
                      child: Text(board[index], style: TextStyle(fontSize: 40)),
                    ),
                  ),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  pointplayer1 = 0;
                  pointplayer2 = 0;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 8, 27, 61),
                minimumSize: Size(170, 40),
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                ),
              ),
              child: Text(
                "Reset",
                style: TextStyle(fontSize: 23, color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Homepage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 8, 27, 61),
                minimumSize: Size(170, 40),
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                ),
              ),
              child: Text(
                "Exit",
                style: TextStyle(fontSize: 23, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
