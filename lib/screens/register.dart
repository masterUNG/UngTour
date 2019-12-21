import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Field
  File file;

  // Method
  Widget nameForm() {
    return Container(
      width: 250.0,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Name',
          helperText: 'Type Your Name',
          hintText: 'English Only',
          icon: Icon(
            Icons.account_box,
            size: 36.0,
          ),
        ),
      ),
    );
  }

  Widget emailForm() {
    return Container(
      width: 250.0,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Email',
          helperText: 'Type Your Email',
          hintText: 'you@email.com',
          icon: Icon(
            Icons.email,
            size: 36.0,
          ),
        ),
      ),
    );
  }

  Widget passwordForm() {
    return Container(
      width: 250.0,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Password',
          helperText: 'Type Your Password',
          hintText: 'More 6 Charactor',
          icon: Icon(
            Icons.lock,
            size: 36.0,
          ),
        ),
      ),
    );
  }

  Widget cameraButton() {
    return RaisedButton.icon(
      color: Colors.purple,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      icon: Icon(
        Icons.add_a_photo,
        color: Colors.white,
      ),
      label: Text(
        'Camera',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        print('You Click Camera');
        cameraAndGallery(ImageSource.camera);
      },
    );
  }

  Future<void> cameraAndGallery(ImageSource imageSource) async {
    var object = await ImagePicker.pickImage(source: imageSource);

    setState(() {
      file = object;
    });
  }

  Widget galleryButton() {
    return OutlineButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      icon: Icon(Icons.add_photo_alternate),
      label: Text('Gallery'),
      onPressed: () {
        cameraAndGallery(ImageSource.gallery);
      },
    );
  }

  Widget showButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        cameraButton(),
        galleryButton(),
      ],
    );
  }

  Widget showPicture() {
    return Container(
      margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width,
      child: file == null
          ? Image.asset(
              'images/picture.png',
              fit: BoxFit.contain,
            )
          : Image.file(file),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            showPicture(),
            showButton(),
            nameForm(),
            emailForm(),
            passwordForm(),
          ],
        ),
      ),
    );
  }
}
