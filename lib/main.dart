import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dicee App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Dice"),
        ),
        body: const Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List diceList = [1, 2, 3, 4, 5, 6];

  var dice1List = 1;
  var dice2List = 1;
  var intValue = Random().nextInt(6);

  String winner = "";

  void _dice1Roll() {
    setState(() {
      //diceList.shuffle();
      dice1List = diceList[Random().nextInt(6)];
    });
  }

  void _dice2Roll() {
    setState(() {
      diceList.shuffle();
      dice2List = diceList[Random().nextInt(6)];
    });
  }

  void _winner() {
    setState(() {
      if (dice1List > dice2List) {
        winner = "Player 1 win";
        var snackbar = SnackBar(
          duration:  const Duration(seconds: 1),
          content:  Text(
            'Player 1 win',
            style: GoogleFonts.amita(
              textStyle: const TextStyle(color: Colors.blue, letterSpacing: .5,fontSize: 20),
            ),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      } else if (dice2List > dice1List) {
        winner = "Player 2 win";
        var snackbar =  SnackBar(
          duration: const Duration(seconds: 1),
          content:  Text(
            'Player 2 win',
            style: GoogleFonts.amita(
              textStyle: const TextStyle(color: Colors.blue, letterSpacing: .5,fontSize: 20),
            ),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      } else {
        winner = "Roll again!";
        var snackbar = SnackBar(
          duration: const Duration(seconds: 1),
          content: Text(
            'Draw',
            style: GoogleFonts.amita(
              textStyle: const TextStyle(color: Colors.blue, letterSpacing: .5,fontSize: 20),
            ),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  "Player 1",
                  style: GoogleFonts.amita(
                    textStyle: const TextStyle(color: Colors.blue, letterSpacing: .5,fontSize: 20),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(20),
                    child: InkWell(
                      onTap: () {
                        _dice1Roll();
                      },
                      child: Image.asset(
                        'images/dice$dice1List.png',
                        color: Colors.black,
                        width: 100,
                        height: 100,
                      ),
                    ))
              ],
            ),
            Column(
              children: [
                Text(
                  "Player 2",
                  style: GoogleFonts.amita(
                    textStyle: const TextStyle(color: Colors.blue, letterSpacing: .5,fontSize: 20),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(20),
                    child: InkWell(
                      onTap: () {
                        _dice2Roll();
                      },
                      child: Image.asset(
                        'images/dice$dice2List.png',
                        color: Colors.black,
                        width: 100,
                        height: 100,
                      ),
                    ))
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        ElevatedButton(
            onPressed: () {
              _winner();
            },
            child: Text(
              "Who is winner",
              style: GoogleFonts.amita(
                textStyle: const TextStyle(color: Colors.amber, letterSpacing: .5,fontSize: 20),
              ),
            )
        ),
      ],
    );
  }
}