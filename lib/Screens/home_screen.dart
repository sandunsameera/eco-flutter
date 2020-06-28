import 'package:eco_flutter/Screens/widget/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

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
            child: Container(
                // height: 40,
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: SignInButton(
                    Buttons.Google,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Navigation()));
                    },
                  ),
                ),
                SizedBox(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: SignInButton(
                    Buttons.Facebook,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Navigation()));
                    },
                  ),
                ),
                SizedBox(height: 32),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
