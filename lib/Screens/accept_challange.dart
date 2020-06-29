import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:eco_flutter/Screens/post_screen.dart';
import 'package:eco_flutter/Screens/widget/commontext.dart';
import 'package:flutter/material.dart';

class AcceptScreen extends StatefulWidget {
  @override
  _AcceptScreenState createState() => _AcceptScreenState();
}

class _AcceptScreenState extends State<AcceptScreen> {
  bool isfav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PostScreen()));
        },
      ),
      appBar: AppBar(
        actions: <Widget>[
          Icon(
            Icons.more_vert,
            color: Colors.black,
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "#enrichthegreen",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 8),
          _searchBar(),
          _abc("assets/images/votechal.png", "Vote Now", Colors.green),
          _abc("assets/images/onechal.png", "Challange", Color(0xff4cb5d5)),
        ],
      ),
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
                title: "Search",
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

  Widget _abc(String url, String text, Color color) {
    return Column(
      children: <Widget>[
        Card(
          child: Container(
            height: 300,
            decoration:
                BoxDecoration(image: DecorationImage(image: AssetImage(url))),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                isfav == false
                    ? IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                        ),
                        onPressed: () {
                          setState(() {
                            isfav = !isfav;
                          });
                        })
                    : IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                            isfav = !isfav;
                          });
                        }),
                IconButton(icon: Icon(Icons.message), onPressed: () {}),
                IconButton(icon: Icon(Icons.share), onPressed: () {}),
              ],
            ),
            Container(
              height: 40,
              width: 120,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: ScaleAnimatedTextKit(
                    onTap: () {
                      print("Tap Event");
                    },
                    text: [text],
                    textStyle:
                        TextStyle(fontSize: 20.0, fontFamily: "Canterbury"),
                    textAlign: TextAlign.start,
                    alignment:
                        AlignmentDirectional.topStart // or Alignment.topLeft
                    ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
