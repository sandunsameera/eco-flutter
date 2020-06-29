import 'dart:io';

import 'package:eco_flutter/Screens/widget/lable_text_field.dart';
import 'package:eco_flutter/resources/resorces.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  TextEditingController dateCtl = TextEditingController();
  File _profilePic;
  getImageFromGallery(ImageSource source) async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _profilePic = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: InkWell(
              onTap: () => getImageFromGallery(ImageSource.gallery),
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
          SizedBox(height: 32),
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
              padding: EdgeInsets.only(left: 16, right: 16),
              child: TextFormField(
                controller: dateCtl,
                decoration: InputDecoration(
                  labelText: "Date of birth",
                  hintText: "Ex. Insert your dob",
                ),
                onTap: () async {
                  DateTime date = DateTime(1900);
                  FocusScope.of(context).requestFocus(new FocusNode());

                  date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100));

                  dateCtl.text = date.toIso8601String();
                },
              )),
          SizedBox(height: 32),
          Padding(
            padding: EdgeInsets.only(left: 32, right: 32),
            child: RaisedButton(
              color: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child:
                  Text("Post challange", style: TextStyle(color: Colors.white)),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
