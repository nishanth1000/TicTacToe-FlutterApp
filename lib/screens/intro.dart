import 'package:flutter/material.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tic-Tac-Toe',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.black87,
                  fontSize: 40,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.pushReplacementNamed(context, '/home');
                  });
                },
                style: TextButton.styleFrom(
                    backgroundColor: Colors.black87),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    'Start',
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w200,
                        color: Colors.white),
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}
