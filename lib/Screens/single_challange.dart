import 'package:flutter/material.dart';
import '../Screens/accept_challange.dart';

class SingleCHallange extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      print(DataHandle.selligndog.toString());
      super.initState();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 4 / 5,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/challange.png"),
                    fit: BoxFit.cover)),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(left: 32, bottom: 32, right: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.black)),
                        height: 40,
                        width: 100,
                        child: Icon(
                          Icons.timelapse,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        child: RaisedButton(
                          color: Colors.green,
                          child: Text(
                            "Accept",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AcceptScreen()));
                          },
                        ),
                        height: 40,
                        width: 120,
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
