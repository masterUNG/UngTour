import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Field

  // Method

  Widget cameraButton() {
    return RaisedButton.icon(
      icon: Icon(Icons.add_a_photo),
      label: Text('Camera'),
      onPressed: (){},
    );
  }

  Widget showButton() {
    return Row(
      children: <Widget>[],
    );
  }

  Widget showPicture() {
    return Container(
      margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        'images/picture.png',
        fit: BoxFit.contain,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Column(
        children: <Widget>[
          showPicture(),
        ],
      ),
    );
  }
}
