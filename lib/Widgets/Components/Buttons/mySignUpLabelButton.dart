import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MySignUpLabelButton extends StatelessWidget {
  final String firstText;
  final String secondText;
  final Color secondTextColor;
  final Widget widgetToNavigate;
  MySignUpLabelButton(
      {this.firstText,
      this.secondText,
      this.secondTextColor,
      this.widgetToNavigate});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => widgetToNavigate)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            firstText,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              secondText,
              style: TextStyle(
                  color: secondTextColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
