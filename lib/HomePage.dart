import 'package:flutter/material.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCross = true;
  String message = "";
  List<String> gameState = [
    "empty",
    "empty",
    "empty",
    "empty",
    "empty",
    "empty",
    "empty",
    "empty",
    "empty",
  ];
  AssetImage cross = AssetImage('images/cross.png');
  AssetImage circle = AssetImage('images/circle.png');
  AssetImage edit = AssetImage('images/edit.png');

  //TODO Initilize the state of the empty box
  @override
  void initState() {
    super.initState();
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }

  //TODO Play game method
  playGame(int index) {
    if (this.gameState[index] == "empty") {
      setState(() {
        if (this.isCross) {
          this.gameState[index] = "cross";
          this.isCross = false;
        } else {
          this.gameState[index] = "circle";
          this.isCross = true;
        }
        this.checkWin();
      });
    }
  }

  //TODO reset game method
  void resetGame() {
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }

  //TODO get image methdod
  AssetImage getImage(String value) {
    switch (value) {
      case "empty":
        return edit;
      case "cross":
        return cross;
      case "circle":
        return circle;
    }
    return edit;
  }

  //TODO check for win logic
  bool checkWin() {
    bool win = false;
    String? winner;
    if ((this.gameState[0] != "empty") &&
        (this.gameState[0] == this.gameState[1]) &&
        (this.gameState[0] == this.gameState[2])) {
      win = true;
      winner = this.gameState[0];
    } else if ((this.gameState[3] != "empty") &&
        (this.gameState[3] == this.gameState[4]) &&
        (this.gameState[3] == this.gameState[5])) {
      win = true;
      winner = this.gameState[3];
    } else if ((this.gameState[6] != "empty") &&
        (this.gameState[6] == this.gameState[7]) &&
        (this.gameState[6] == this.gameState[8])) {
      win = true;
      winner = this.gameState[5];
    } else if ((this.gameState[0] != "empty") &&
        (this.gameState[0] == this.gameState[3]) &&
        (this.gameState[0] == this.gameState[6])) {
      win = true;
      winner = this.gameState[0];
    } else if ((this.gameState[1] != "empty") &&
        (this.gameState[1] == this.gameState[4]) &&
        (this.gameState[1] == this.gameState[7])) {
      win = true;
      winner = this.gameState[1];
    } else if ((this.gameState[2] != "empty") &&
        (this.gameState[2] == this.gameState[5]) &&
        (this.gameState[2] == this.gameState[8])) {
      win = true;
      winner = this.gameState[2];
    } else if ((this.gameState[0] != "empty") &&
        (this.gameState[0] == this.gameState[4]) &&
        (this.gameState[0] == this.gameState[8])) {
      win = true;
      winner = this.gameState[0];
    } else if ((this.gameState[2] != "empty") &&
        (this.gameState[2] == this.gameState[4]) &&
        (this.gameState[2] == this.gameState[6])) {
      win = true;
      winner = this.gameState[2];
    } else if (!this.gameState.contains("empty")) {
      setState(() {
        this.message = "Game Draw";
      });
    }
    if (win) {
      setState(() {
        this.message = "${winner} wins";
        Timer(Duration(seconds: 2), () {
          // <-- Delay here
          setState(() {
            resetGame(); // <-- Code run after delay
          });
        });
      });
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TicTacToe Game"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0),
              itemCount: this.gameState.length,
              itemBuilder: (context, index) => SizedBox(
                  height: 100.0,
                  width: 100.0,
                  child: MaterialButton(
                      onPressed: () => playGame(index),
                      child: Image(
                        image: this.getImage(this.gameState[index]),
                      ))),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                this.message,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              MaterialButton(
                onPressed: resetGame,
                child: Text(
                  "Reset",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                color: Colors.purple,
                minWidth: 300,
              ),
              Text("Game by Aayush Patel")
            ],
          )
        ],
      ),
    );
  }
}
