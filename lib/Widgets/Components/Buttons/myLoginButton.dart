import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyLoginButton extends StatelessWidget {
  final String text;
  final Color colorText;
  final Color colorButtonBackground;
  final Widget widgetToNavigate;
  MyLoginButton(
      {this.text,
      this.colorText,
      this.colorButtonBackground,
      this.widgetToNavigate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50.0, bottom: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => widgetToNavigate)),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        color: colorButtonBackground,
        child: Text(
          text,
          style: TextStyle(
              color: colorText,
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
