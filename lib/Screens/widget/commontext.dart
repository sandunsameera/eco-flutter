import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  final double top;
  final double bottom;
  final double left;
  final double right;
  final String title;
  final String fontfamily;
  final double fontsize;
  final Color color;

  const CommonText(
      {Key key,
      this.top,
      this.bottom,
      this.left,
      this.right,
      this.title,
      this.fontfamily,
      this.fontsize,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: top, bottom: bottom, left: left, right: right),
      child: Text(
        title,
        style:
            TextStyle(color: color, fontFamily: fontfamily, fontSize: fontsize),
      ),
    );
  }
}