import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  GradientButton(
      {@required this.onPressed,
      @required this.title,
      @required this.fromColor,
      @required this.toColor});

  final GestureTapCallback onPressed;
  final String title;
  final Color fromColor;
  final Color toColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: RaisedButton(
        onPressed: onPressed,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [fromColor, toColor],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            constraints: BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.button,
            ),
          ),
        ),
      ),
    );
  }
}
