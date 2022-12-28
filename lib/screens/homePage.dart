import 'dart:math';

import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}


class _homeState extends State<home> {



  final Map<String, int>  myDice = {
    "Dice/dice1.png": 1,
    "Dice/dice2.png": 2,
    "Dice/dice3.png": 3,
    "Dice/dice4.png": 4,
    "Dice/dice5.png": 5,
    "Dice/dice6.png": 6,
  };
  List<Image> playerDice = [];
  int score = 0;

  String? firstDice;
  String? secondDice;


  void changeDice(){
    playerDice = [];

    Random random = new Random();

    String firstDiceKey = myDice.keys.elementAt(random.nextInt(myDice.length));




    String secondDiceKey = myDice.keys.elementAt(random.nextInt(myDice.length));

    playerDice.add(Image.asset(firstDiceKey));
    playerDice.add(Image.asset(secondDiceKey));

    score = myDice[firstDiceKey]!+ myDice[secondDiceKey]!;

  }


  @override
  void initState() {
    super.initState();
    changeDice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.deepOrange ,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(text: TextSpan(
              text: "score: $score",
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold
              )
            )),

            Column(
              children: [
                GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: playerDice.length,
                    itemBuilder: (context, index){

                      return playerDice[index];

                    }),
              ],
            ),
            const SizedBox(height: 40,),
            ElevatedButton(
                onPressed:(){
                  setState(() {
                    changeDice();
                  });
                },
                child:const Text("ROLL",)),

            
          ],
        ),
      ),

    );
  }
}
