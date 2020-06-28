import 'package:eco_flutter/Screens/challenge_screen.dart';
import 'package:eco_flutter/Screens/home_screen.dart';
import 'package:eco_flutter/Screens/widget/commontext.dart';
import 'package:eco_flutter/Screens/widget/leaderboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int itemIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: <Widget>[
          _bottomNavBarItem(0, "Profile", Icons.person),
          _bottomNavBarItem(1, "Challanges", Icons.multiline_chart),
          _bottomNavBarItem(2, "Leader board", Icons.assessment),
        ],
      ),
      body: _body(),
    );
  }

  Widget _body() {
    Widget slogan;

    switch (itemIndex) {
      case 0:
        slogan = ChallangeScreen();
        break;
      case 1:
        slogan = ChallangeScreen();
        break;
      case 2:
        slogan = LeaderBoard();
        break;
        break;
      default:
    }
    return slogan;
  }

  Widget _bottomNavBarItem(int index, String field, IconData iconData) {
    return GestureDetector(
      onTap: () {
        setState(() {
          itemIndex = index;
          print(index);
        });
      },
      child: Container(
        height: 70,
        decoration: BoxDecoration(color: Colors.white),
        width: MediaQuery.of(context).size.width / 3,
        child: Column(
          children: <Widget>[
            index == itemIndex
                ? ClipRRect(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: 3,
                      color: Colors.green,
                    ),
                  )
                : SizedBox(height: 3),
            SizedBox(height: 12),
            Icon(iconData,color: Colors.green,),
            SizedBox(height: 8),
            CommonText(
              title: field,
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              color: index == itemIndex ? Colors.green : Color(0xff666666),
              fontsize: 12,
              fontfamily: "Poppins",
            ),
          ],
        ),
      ),
    );
  }
}
