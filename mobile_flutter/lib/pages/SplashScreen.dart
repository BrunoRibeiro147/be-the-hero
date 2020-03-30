import 'package:be_the_hero/pages/Incidents.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SpashScreenState createState() => _SpashScreenState();
}

class _SpashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    
    Future.delayed(Duration(seconds: 4)).then((_) {
      Navigator.pushReplacement(context, 
        MaterialPageRoute(builder: (context) => Incidents(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset("images/splash.png",fit: BoxFit.cover,);
  }
}