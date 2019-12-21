import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ungtour/screens/register.dart';
import 'package:ungtour/utility/my_style.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> with WidgetsBindingObserver {
  // Field

  // Method

  Widget signInButton() {
    return RaisedButton(
      color: MyStyle().textColor,
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {},
    );
  }

  Widget signUpButton() {
    return OutlineButton(
      child: Text('Sign Up'),
      onPressed: () {
        print('You Click SignUp');

        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext buildContext) {
          return Register();
        });
        Navigator.of(context).push(materialPageRoute);
      },
    );
  }

  Widget showButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        signInButton(),
        SizedBox(
          width: 5.0,
        ),
        signUpButton(),
      ],
    );
  }

  Widget userForm() {
    return Container(
      width: 250.0,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(labelText: 'User :'),
      ),
    );
  }

  Widget passwordForm() {
    return Container(
      width: 250.0,
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(labelText: 'Password :'),
      ),
    );
  }

  Widget showLogo() {
    return Container(
      width: 120.0,
      height: 120.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'อึ่ง ท่องเที่ยว',
      style: GoogleFonts.mali(
          textStyle: TextStyle(
        color: MyStyle().textColor,
        fontSize: MyStyle().h1,
        fontWeight: FontWeight.bold,
        letterSpacing: 4.0,
      )),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.inactive:
        print('###### State inactive ######');
        break;
      case AppLifecycleState.paused:
        print('###### State paused ######');
        break;
      case AppLifecycleState.resumed:
        print('###### State resume ######');
        break;
      default:
    }
  }

  // Action After RunApp
  @override
  void initState() {
    super.initState();
    print('######### initState Work ##########');
    WidgetsBinding.instance.addObserver(this);
  }

  // Action Before Pause
  @override
  void dispose() {
    super.dispose();
    print('######### dispost Work ##########');
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/wall2.jpg'), fit: BoxFit.cover),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color.fromARGB(180, 255, 255, 255),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    showLogo(),
                    SizedBox(
                      height: 16.0,
                    ),
                    showAppName(),
                    userForm(),
                    passwordForm(),
                    showButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
