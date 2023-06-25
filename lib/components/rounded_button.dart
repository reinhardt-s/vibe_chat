import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  Function onPressed;
  String text;
  Color color;
  RoundedButton({super.key, required this.onPressed, required this.text, this.color = Colors.lightBlueAccent});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () {
            onPressed();
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}
