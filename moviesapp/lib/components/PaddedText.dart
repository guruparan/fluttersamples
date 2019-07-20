import 'package:flutter/material.dart';

class PaddedText extends StatelessWidget {
  final String text;

  PaddedText(this.text);

  @override
  Widget build(BuildContext contex) {
    return Padding(
        child: Text(this.text), 
        padding: EdgeInsets.only(top: 5, bottom: 5));
  }
}
