import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset('images/logo.png'),
          RichText(
            text: TextSpan(
              style: TextStyle(color: Color(0xff737380),fontSize: 15),
              children: [
                TextSpan(text: "Total de "),
                TextSpan(text: "0 Casos",style: TextStyle(fontWeight: FontWeight.bold))
              ]
            ),
          )
        ],
      ),
    );
  }
}