import 'package:eco_flutter/Screens/widget/commontext.dart';
import 'package:eco_flutter/resources/resorces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isgood = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            InkWell(
              onTap: () {
                setState(() {
                  isgood = true;
                });
              },
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: isgood == false
                            ? AssetImage("assets/images/profile.png")
                            : AssetImage("assets/images/profile2.png"),
                        fit: BoxFit.cover)),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.only(left: 32, right: 32),
              child: LinearPercentIndicator(
                animateFromLastPercent: true,
                addAutomaticKeepAlive: true,
                animation: true,
                clipLinearGradient: true,
                percent: isgood == false ? 0.2 : 0.9,
                backgroundColor: Colors.grey,
                progressColor: Colors.blue,
              ),
            ),
            SizedBox(height: 32),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SvgPicture.asset("assets/images/verified_svg.svg"),
                    CommonText(
                      title: "10/14 wins",
                      left: 4,
                      right: 0,
                      top: 0,
                      bottom: 0,
                      fontsize: 14,
                      fontfamily: ColorThemes.medium,
                      color: ColorThemes.textfieldtext,
                    )
                  ],
                ),
                SizedBox(width: 24),
                Row(
                  children: <Widget>[
                    SvgPicture.asset("assets/images/bag_svg.svg"),
                    CommonText(
                      title: "15800 earned",
                      left: 4,
                      right: 0,
                      top: 0,
                      bottom: 0,
                      fontsize: 14,
                      fontfamily: ColorThemes.medium,
                      color: ColorThemes.brightText,
                    )
                  ],
                ),
                SizedBox(width: 24),
                Row(
                  children: <Widget>[
                    SvgPicture.asset("assets/images/star_svg.svg"),
                    CommonText(
                      title: "150 balance",
                      left: 4,
                      right: 0,
                      top: 0,
                      bottom: 0,
                      fontsize: 14,
                      fontfamily: ColorThemes.medium,
                      color: ColorThemes.brightText,
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
Widget _bodyGrid() {
    if (Challanges != null) {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: Challanges != null ? Challanges.documents.length : 0,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Container(
                  child: InkWell(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Challanges.documents[index].data['UserId'] == uid
                                  ? IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        firestoreServices.deletePostedAds(
                                            Challanges
                                                .documents[index].reference);
                                      })
                                  : SizedBox(),
                            ],
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 10, left: 10, right: 10),
                            height: 250,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(Challanges
                                                .documents[index]
                                                .data['Picture_url'] !=
                                            null
                                        ? Challanges.documents[index]
                                            .data['Picture_url']
                                        : ""))),
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 16, right: 16),
                              height: 80,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Flexible(
                                      child: Container(
                                    child: Text(
                                      Challanges
                                          .documents[index].data["Description"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  )),
                                  SizedBox(width: 16),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Challanges.documents[index]
                                                .data['UserId'] !=
                                            uid
                                        ? RaisedButton(
                                            color: Colors.blue,
                                            child: Text(
                                              "Message",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            onPressed: () {
                                              DataHandle.ownername = Challanges
                                                  .documents[index]
                                                  .data['OwnerName'];
                                              createChatroomAndStartConversation(
                                                  Challanges.documents[index]
                                                      .data['OwnerName']);
                                            },
                                          )
                                        : Container(
                                            child: Text(
                                              "Posted by you",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green),
                                            ),
                                          ),
                                  ),
                                ],
                              ))
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          DataHandle.type = "Cross";
                        });
                        DataHandle.selligndog =
                            Challanges.documents[index].data;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SingleDogProfile()));
                      }),
                ),
              ),
            );
          });
    } else {
      return Container(
          child: Center(
        child: Text("Still fetching data please wait..."),
      ));
    }
  }
}

  }

  Widget buildResultCard(url) {
    return Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 2.0,
        child: Container(
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: NetworkImage(url), fit: BoxFit.cover)),
        ));
  }
}
