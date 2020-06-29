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
                      title: "15800 stars earned",
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
            GridView.count(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              primary: false,
              shrinkWrap: true,
              children: [
                buildResultCard(
                    "https://gamersforgood.com/wp-content/uploads/2017/12/ICCD_Hero_Image_Beach_Cleanup_1440x550.jpeg"),
                isgood == true
                    ? buildResultCard(
                        "https://i.ytimg.com/vi/N35qAtcG0Ck/maxresdefault.jpg")
                    : SizedBox(),
                isgood == true
                    ? buildResultCard(
                        "https://jamentrust.org/wp-content/uploads/2016/02/Beach-Cleanup-2014-38.jpg")
                    : SizedBox(),
                isgood == true
                    ? buildResultCard(
                        "http://www.ticotimes.net/wp-content/uploads/2014/10/Planting-Trees-1-1000x662.jpg")
                    : SizedBox(),
                isgood == true
                    ? buildResultCard(
                        "https://rdcnewscdn.realtor.com/wp-content/uploads/2016/04/planting-tree-1024x576.jpg")
                    : SizedBox(),
                isgood == true
                    ? buildResultCard(
                        "https://rdcnewscdn.realtor.com/wp-content/uploads/2016/04/planting-tree-1024x576.jpg")
                    : SizedBox(),
                isgood == true
                    ? buildResultCard(
                        "https://gamersforgood.com/wp-content/uploads/2017/12/ICCD_Hero_Image_Beach_Cleanup_1440x550.jpeg")
                    : SizedBox(),
                isgood == true
                    ? buildResultCard(
                        "https://gamersforgood.com/wp-content/uploads/2017/12/ICCD_Hero_Image_Beach_Cleanup_1440x550.jpeg")
                    : SizedBox(),
              ],
            ),
          ],
        ));
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
