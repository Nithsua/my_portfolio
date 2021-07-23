import 'package:flutter/material.dart';
import 'package:my_portfolio/main.dart';

class BetaAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AlertDialog(
          title: Text("It's a beta"),
          content: Text(
              "Written in flutter and i'm noob so please don't mind the performance overhead, I'm working on improve it"),
          actions: [
            OutlinedButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyApp())),
              child: Text("ok"),
            ),
          ],
        ),
      ),
    );
  }
}
