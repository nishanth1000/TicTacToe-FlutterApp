import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> displayxo = ['', '', '', '', '', '', '', '', ''];
  bool oturn = true;
  int xscore = 0;
  int oscore = 0;
  int count = 0;
  String dataTurn = 'Your Turn';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: RotatedBox(
                quarterTurns: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Player: X',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.black87,
                              fontSize: 25),
                        ),
                        Text(
                          'Score: ' + xscore.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.black87,
                              fontSize: 25),
                        ),
                      ],
                    ),
                    !oturn
                        ? Text(
                            dataTurn,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                fontSize: 25),
                          )
                        : Text(''),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemCount: 9,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          tapped(index);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                width: 0,
                                color: Colors.white,
                              ),
                              color: Colors.black87,
                            ),
                            child: Center(
                                child: Text(
                              displayxo[index],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontWeight: FontWeight.w400),
                            )),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Player: O',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.black87,
                            fontSize: 25),
                      ),
                      Text(
                        'Score: ' + oscore.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.black87,
                            fontSize: 25),
                      ),
                    ],
                  ),
                  oturn
                      ? Text(
                          dataTurn,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              fontSize: 25),
                        )
                      : Text(''),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void tapped(index) {
    setState(() {
      if (oturn == true && displayxo[index] == '') {
        displayxo[index] = 'O';

        oturn = false;
      }
      if (oturn == false && displayxo[index] == '') {
        displayxo[index] = 'X';

        oturn = true;
      }
      count += 1;
      checkWinner();
    });
  }

  void checkWinner() {
    if (count > 8) {
      resetGame('Draw');
    }

    if ((displayxo[0] == displayxo[1]) &&
        (displayxo[0] == displayxo[2]) &&
        displayxo[0] != '') {
      resetGame(displayxo[0]);
    }
    if ((displayxo[3] == displayxo[4]) &&
        (displayxo[3] == displayxo[5]) &&
        displayxo[3] != '') {
      resetGame(displayxo[3]);
    }
    if ((displayxo[6] == displayxo[7]) &&
        (displayxo[6] == displayxo[8]) &&
        displayxo[6] != '') {
      resetGame(displayxo[6]);
    }
    if ((displayxo[0] == displayxo[3]) &&
        (displayxo[0] == displayxo[6]) &&
        displayxo[0] != '') {
      resetGame(displayxo[0]);
    }
    if ((displayxo[1] == displayxo[4]) &&
        (displayxo[1] == displayxo[7]) &&
        displayxo[1] != '') {
      resetGame(displayxo[1]);
    }
    if ((displayxo[2] == displayxo[5]) &&
        (displayxo[2] == displayxo[8]) &&
        displayxo[2] != '') {
      resetGame(displayxo[2]);
    }
    if ((displayxo[0] == displayxo[4]) &&
        (displayxo[0] == displayxo[8]) &&
        displayxo[0] != '') {
      resetGame(displayxo[0]);
    }
    if ((displayxo[2] == displayxo[4]) &&
        (displayxo[2] == displayxo[6]) &&
        displayxo[2] != '') {
      resetGame(displayxo[2]);
    }
  }

  void resetGame(String text) {
    setState(() {
      count = 0;
      displayxo = ['', '', '', '', '', '', '', '', ''];
      print(text);
      if (text == 'X') {
        xscore += 1;
        Navigator.pushNamed(context, '/win',arguments: {
          'win':'X wins the Game.'
        });
      } else if (text == 'O') {
        oscore += 1;
        Navigator.pushNamed(context, '/win',arguments: {
          'win':'O wins the Game.'
        });
      } else if (text == 'Draw') {
        print('Draw');
        Navigator.pushNamed(context, '/win',arguments: {
          'win':'Draw Match.'
        });
      }
    });
  }
}
