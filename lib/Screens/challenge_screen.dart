import 'package:eco_flutter/Screens/single_challange.dart';
import 'package:eco_flutter/Screens/widget/commontext.dart';
import 'package:flutter/material.dart';

class ChallangeScreen extends StatefulWidget {
  @override
  _ChallangeScreenState createState() => _ChallangeScreenState();
}

class _ChallangeScreenState extends State<ChallangeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _body(),
    );
  }

  Widget _body() {
    return ListView(
      children: <Widget>[
        SizedBox(height: 8),
        Center(
          child: Text("Challange of the Month",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
        ),
        SizedBox(height: 32),
        _searchBar(),
        _challengeCard("assets/images/chal1.jpg"),
        SizedBox(height: 32),
        _challengeCard("assets/images/chal2.png"),
        SizedBox(height: 32),
        _challengeCard("assets/images/chal1.jpg"),
        SizedBox(height: 32),
        _challengeCard("assets/images/chal2.png"),
      ],
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          height: 50,
          // color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CommonText(
                title: "Search by Hashtags",
                color: Colors.black,
                left: 16,
                right: 0,
                top: 12,
                bottom: 12,
              ),
              Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Icon(
                    Icons.search,
                    color: Colors.green,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _challengeCard(String url) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SingleCHallange()));
      },
      child: Card(
        child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Image.asset(url)),
      ),
    );
  }
}
