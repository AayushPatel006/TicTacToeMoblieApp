import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCross = true;
  String? message;
  List<String>? gameState;
  AssetImage cross = AssetImage('images/cross.png')
  AssetImage circle = AssetImage('images/circle.png')
  AssetImage edit = AssetImage('images/edit.png')

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


  //TODO reset game method

  //TODO get image methdod

  //TODO check for win logic

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TicTacToe Game"),
        backgroundColor: Colors.purple,
      ),
    );
  }
}
