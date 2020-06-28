import 'package:eco_flutter/Screens/widget/navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/images/home.png",
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 60),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 80,
                    height: 40,
                    child: RaisedButton(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Navigation()));
                      },
                      child: Text("Lets gamble"),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
