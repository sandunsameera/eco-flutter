import 'dart:io';

import 'package:calendar_strip/calendar_strip.dart';
import 'package:eco_flutter/Screens/widget/lable_text_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}


class _PostScreenState extends State<PostScreen> {

   File _image;

  getImageFromGallery() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }


  Future uploadPic(BuildContext context, Map data) async {
    AuthResult user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'sandun@gmail.com', password: "sandun");
    StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(DateTime.now().toString());
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    uploadedFileURL = await (await uploadTask.onComplete).ref.getDownloadURL();
    print("before" + uploadedFileURL);
    firestoreServices.addtosell(data).then((value) {
      print("Data saved");
    }).catchError((e) {
      print(e);
    });
    print("after" + uploadedFileURL);
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    this.getUserId();
  }




  DateTime startDate = DateTime.now().subtract(Duration(days: 2));
  DateTime endDate = DateTime.now().add(Duration(days: 2));
  DateTime selectedDate = DateTime.now().subtract(Duration(days: 2));
  List<DateTime> markedDates = [
    DateTime.now().subtract(Duration(days: 1)),
    DateTime.now().subtract(Duration(days: 2)),
    DateTime.now().add(Duration(days: 4))
  ];

  bool state = false;
  double value = 11;
  getMarkedIndicatorWidget() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        margin: EdgeInsets.only(left: 1, right: 1),
        width: 7,
        height: 7,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
      ),
      Container(
        width: 7,
        height: 7,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
      )
    ]);
  }

  dateTileBuilder(
      date, selectedDate, rowIndex, dayName, isDateMarked, isDateOutOfRange) {
    bool isSelectedDate = date.compareTo(selectedDate) == 0;
    Color fontColor = isDateOutOfRange ? Colors.black26 : Colors.black87;
    TextStyle normalStyle =
        TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: fontColor);
    TextStyle selectedStyle = TextStyle(
        fontSize: 17, fontWeight: FontWeight.w800, color: Colors.black87);
    TextStyle dayNameStyle = TextStyle(fontSize: 14.5, color: fontColor);
    List<Widget> _children = [
      Text(dayName, style: dayNameStyle),
      Text(date.day.toString(),
          style: !isSelectedDate ? normalStyle : selectedStyle),
    ];

    if (isDateMarked == true) {
      _children.add(getMarkedIndicatorWidget());
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 8, left: 5, right: 5, bottom: 5),
      decoration: BoxDecoration(
        color: !isSelectedDate ? Colors.transparent : Colors.white70,
        borderRadius: BorderRadius.all(Radius.circular(60)),
      ),
      child: Column(
        children: _children,
      ),
    );
  }

  TextEditingController dateCtl = TextEditingController();
  File _profilePic;
  getImageFromGallery(ImageSource source) async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _profilePic = image;
    });
  }

  onSelect(data) {
    print("Selected Date -> $data");
  }

  _monthNameWidget(monthName) {
    return Container(
      child: Text(monthName,
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
              fontStyle: FontStyle.italic)),
      padding: EdgeInsets.only(top: 8, bottom: 4),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: InkWell(
              onTap: () => getImageFromGallery(ImageSource.gallery),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                    height: MediaQuery.of(context).size.height / 4,
                    color: Color(0xffe8e8e8),
                    child: _profilePic == null
                        ? Center(
                            child: IconButton(
                              icon: Icon(
                                Icons.camera_alt,
                                color: Colors.green,
                                size: 40,
                              ),
                              onPressed: () {},
                            ),
                          )
                        : Image.file(_profilePic, fit: BoxFit.cover)),
              ),
            ),
          ),
          SizedBox(height: 32),
          Row(
            children: <Widget>[
              Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: LiteRollingSwitch(
                  value: true,
                  textOn: 'Gambling',
                  textOff: 'Not gamble',
                  colorOn: Colors.deepOrange,
                  colorOff: Colors.blueGrey,
                  iconOn: Icons.lightbulb_outline,
                  iconOff: Icons.power_settings_new,
                  onChanged: ( state) {
                    print('turned ${(state) ? 'on' : 'off'}');
                  },
                ),
              ),
              SizedBox(
                width: 16,
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: LabelTextField(
              hintText: "Description",
              labelText: "Description",
              borderColor: Colors.green,
            ),
          ),
          SizedBox(height: 32),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              "Set Points to gamble",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Slider(
            min: 10,
            max: 100,
            value: value,
            divisions: 09,
            label: "$value" + " points",
            onChanged: (newvalue) {
              setState(() {
                value = newvalue;
              });
            },
          ),
          SizedBox(height: 32),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                  child: CalendarStrip(
                startDate: startDate,
                endDate: endDate,
                onDateSelected: onSelect,
                dateTileBuilder: dateTileBuilder,
                iconColor: Colors.black87,
                monthNameWidget: _monthNameWidget,
                markedDates: markedDates,
                containerDecoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xff4ac29a),
                    Color(0xffbdfff3),
                  ],
                )),
              )),
            ),
          ),
          SizedBox(height: 132),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(left: 32, right: 32),
              child: Container(
                width: MediaQuery.of(context).size.width - 32,
                height: 40,
                child: RaisedButton(
                  elevation: 20,
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text("Post challange",
                      style: TextStyle(color: Colors.white)),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
