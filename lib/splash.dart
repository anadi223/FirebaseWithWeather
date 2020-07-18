
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:signinwithfire/Login.dart';
import 'package:signinwithfire/Register.dart';

const kButtonTextStyle = TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.white);
class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/1.7,
              child: FlareActor("assets/weather.flr",fit: BoxFit.contain,animation: "start",),
            ),
            CustomReusableButton(
              text: Text("Login",
                style: kButtonTextStyle),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>LoginPage()));
              },
              color: Colors.grey,
            ),
            CustomReusableButton(
              text: Text("Register",
              style: kButtonTextStyle,),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>RegisterPage()));
              },
              color: Colors.blue[600],
            ),
          ],
        ),
      ),
    );
  }
}


class CustomReusableButton extends StatelessWidget {
  final Text text;
  final Function onPressed;
  final Color color;

  const CustomReusableButton({Key key, this.text, this.onPressed, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left:20.0,right: 20.0,bottom: 20.0),
      child: MaterialButton(
          elevation: 7.0,
          child: text,
          color: color,
          onPressed: onPressed,
          height: 60.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))
      ),
    );
  }
}



