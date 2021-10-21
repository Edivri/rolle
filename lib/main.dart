import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          title: Text('Rolle'),
          backgroundColor: Colors.teal,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var leftDN = 1;
  var rightDN = 1;
  // a function to roll both dices simultaneously
  void roller() {
    leftDN = Random().nextInt(6) + 1;
    rightDN = Random().nextInt(6) + 1;
  }
 // GET THE WINNER
  String rwinner() {
    if (leftDN > rightDN) {
      return "PLAYER 1";
    } else if (leftDN < rightDN){
      return "PLAYER 2";
    }else{
      return "DRAW";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Player 1:  $leftDN',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40.0,
          ),
        ),
        Text(
          'Player 2: $rightDN',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40.0,
          ),
        ),
        SizedBox(
          height: 20.0,
          width: 200.0,
          child: Divider(
            color: Colors.deepOrangeAccent,
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    roller();
                    //leftDN = Random().nextInt(6) +1 ;
                  });
                },
                child: Image.asset('images/dice$leftDN.png'),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    roller();
                    //rightDN = Random().nextInt(6) +1 ;
                  });
                },
                child: Image.asset('images/dice$rightDN.png'),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
          width: 200.0,
          child: Divider(
            color: Colors.deepOrangeAccent,
          ),
        ),
        Text(
          'WINNER:  ${rwinner()}',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40.0,
          ),
        ),
      ],
    );
  }
}
