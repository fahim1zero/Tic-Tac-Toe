// ignore_for_file: prefer_const_constructors,
// ignore_for_file: prefer_typing_uninitialized_variables,

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:tic_tac_toe/custom_dialog.dart';
import 'package:tic_tac_toe/game_button.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<GameButton> buttonsList;
  var player1;
  var player2;
  var activePlayer;

  @override
  void initState() {
    super.initState();
    buttonsList = doInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode == false ? Colors.white : Colors.grey,
      appBar: AppBar(
        backgroundColor: darkMode == false ? Colors.white : Colors.black87,
        title: Text(
          "Tic Tac Toe",
          style: TextStyle(
            color: darkMode == false ? Colors.black : Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        actions: [
          Switch(
            value: darkMode,
            onChanged: (value) {
              setState(() {
                darkMode = value;
              });
            },
            activeTrackColor: Colors.grey,
            activeColor: Colors.blue,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 15),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: buttonsList.length,
              itemBuilder: (context, i) => SizedBox(
                height: 100, width: 100,

                /// ignore: deprecated_member_use
                child: RaisedButton(
                  padding: EdgeInsets.all(8),
                  onPressed: buttonsList[i].enabled
                      ? () => playGame(buttonsList[i])
                      : null,
                  child: Text(
                    buttonsList[i].text,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 50,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  color: buttonsList[i].bg,
                  disabledTextColor: buttonsList[i].bg,
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          // ignore: deprecated_member_use
          RaisedButton(
            child: Text(
              "Reset",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            onPressed: resetGame,
            elevation: 10,
            color: Colors.red,
            padding: EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 15,
            ),
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }

  List<GameButton> doInit() {
    player1 = [];
    player2 = [];
    activePlayer = 1;
    return [
      GameButton(id: 1),
      GameButton(id: 2),
      GameButton(id: 3),
      GameButton(id: 4),
      GameButton(id: 5),
      GameButton(id: 6),
      GameButton(id: 7),
      GameButton(id: 8),
      GameButton(id: 9),
    ];
  }

  void playGame(GameButton gb) {
    setState(() {
      if (activePlayer == 1) {
        gb.text = "X";
        gb.bg = Colors.cyan;
        activePlayer = 2;
        player1.add(gb.id);
      } else {
        gb.text = "0";
        gb.bg = Colors.indigo;
        activePlayer = 1;
        player2.add(gb.id);
      }
      gb.enabled = false;
      int winner = checkWinner();
      if (winner == -1) {
        if (buttonsList.every((p) => p.text != " ")) {
          showDialog(
            context: context,
            builder: (_) => CustomDialog(
              "Game Tied",
              "Press the reset button to start again",
              resetGame,
            ),
          );
        } else {
          activePlayer == 2 ? autoPlay() : null;
        }
      }
    });
  }

  void autoPlay() {
    var emptyCells = [];
    var list = List.generate(9, (i) => i + 1);
    for (var cellID in list) {
      if (!(player1.contains(cellID) || player2.contains(cellID))) {
        emptyCells.add(cellID);
      }
    }

    var r = Random();
    var randIndex = r.nextInt(emptyCells.length - 1);
    var cellID = emptyCells[randIndex];
    int i = buttonsList.indexWhere((p) => p.id == cellID);
    playGame(buttonsList[i]);
  }

  void resetGame() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
      setState(() {
        buttonsList = doInit();
      });
    }
  }

  int checkWinner() {
    var winner = -1;

    ///row1
    if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
      winner = 2;
    }

    ///row2
    if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
      winner = 1;
    }
    if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
      winner = 2;
    }

    ///row3
    if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(8) && player2.contains(9)) {
      winner = 2;
    }

    ///column1
    if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
      winner = 2;
    }

    ///column2
    if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
      winner = 1;
    }
    if (player2.contains(2) && player2.contains(4) && player2.contains(8)) {
      winner = 2;
    }

    ///column3
    if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
      winner = 2;
    }

    ///cross1
    if (player1.contains(1) && player1.contains(5) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(5) && player2.contains(9)) {
      winner = 2;
    }

    ///cross2
    if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
      winner = 2;
    }

    if (winner != -1) {
      if (winner == 1) {
        showDialog(
          context: context,
          builder: (_) => CustomDialog(
            "Player 1 Won",
            "Press The Reset Button to Start Again",
            resetGame,
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (_) => CustomDialog(
            "Player 2 Won",
            "Press The Reset Button to Start Again",
            resetGame,
          ),
        );
      }
    }
    return winner;
  }
}
