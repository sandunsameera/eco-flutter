import 'package:flutter/material.dart';

class LeaderBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/leaderboard.png"),fit: BoxFit.cover)),
      ),
    );
  }
}
