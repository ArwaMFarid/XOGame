import 'package:flutter/material.dart';
import 'package:x_o_game/enter_names.dart';
// import 'package:x_o_game/twoplayer.dart';
import 'dart:io';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/360_F_323880864_TPsH5ropjEBo1ViILJmcFHJqsBzorxUB.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment(0, .8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Soon"),
                        content: Text("Coming Soon 👀"),
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
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  minimumSize: Size(250, 50),
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(17)),
                  ),
                ),
                child: Text(
                  "One Player",
                  style: TextStyle(
                    fontSize: 30,
                    color: const Color.fromARGB(255, 32, 126, 35),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => EnterNames(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  minimumSize: Size(250, 50),
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(17)),
                  ),
                ),
                child: Text(
                  "Two Player",
                  style: TextStyle(
                    fontSize: 30,
                    color: const Color.fromARGB(255, 32, 126, 35),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  exit(0);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  minimumSize: Size(250, 50),
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(17)),
                  ),
                ),
                child: Text(
                  "Exit",
                  style: TextStyle(
                    fontSize: 30,
                    color: const Color.fromARGB(255, 32, 126, 35),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
