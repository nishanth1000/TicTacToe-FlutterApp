import 'package:flutter/material.dart';

class Win extends StatefulWidget {
  const Win({Key? key}) : super(key: key);

  @override
  State<Win> createState() => _WinState();
}

class _WinState extends State<Win> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    dynamic data = ModalRoute
        .of(context)
        ?.settings
        .arguments;
    print(data);
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: const Color(0xff766174),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: RotatedBox(
                quarterTurns: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        data['win'],
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 30,
                            color: Colors.black87),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Center(
                      child: Text('Tap to Play Again', style: TextStyle(color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.w300),),
                    )
                  ],
                ),
              ),
            ),
            Divider(color: Colors.black),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      data['win'],
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 30,
                          color: Colors.black87),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Center(
                    child: Text('Tap to Play Again', style: TextStyle(color: Colors.black54,
                        fontSize: 20,
                        fontWeight: FontWeight.w300),),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
