import 'package:flutter/material.dart';

class Themes {
  light() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Color(0xffe03041),
      accentColor: Colors.white,
      textTheme: TextTheme(
        title: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Color(0xff13131a),
        ),
        subtitle: TextStyle(
          fontSize: 16,
          height: 2.4,
          color: Color(0xff737380),
        ),
        body1: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xff41414d),
        ),
        body2: TextStyle(
          fontSize: 15,
          color: Color(0xff737380),
        ),
        button: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Color(0xffe03041),
        ),
      ),
    );
  }

  dark() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Color(0xffe03041),
      accentColor: Colors.black,
      textTheme: TextTheme(
        title: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Color(0xffe03041),
        ),
        subtitle: TextStyle(
          fontSize: 16,
          height: 2.4,
          color: Color(0xff737380),
        ),
        body1: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
        body2: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
        button: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Color(0xffe02041),
        ),
      ),
    );
  }
}
